#!/bin/bash

set -euo pipefail

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

# Path to the input file
input_file="../Formula/fe.rb"

# Extract the version from the explicit formula version declaration
version=$(grep -E '^[[:space:]]*version "' "${input_file}" | head -n 1 | sed -E 's/^[[:space:]]*version "([^"]+)".*/\1/' || true)

# Check if version is not empty
if [[ -n "${version}" ]]
then
  # Define the new filename
  new_filename="../Formula/fe@${version}.rb"
  class_name=$(ruby -e 'name = ARGV.fetch(0); class_name = name.capitalize; class_name.gsub!(/[-_.\s]([a-zA-Z0-9])/) { Regexp.last_match(1).upcase }; class_name.tr!("+", "x"); class_name.sub!(/(.)@(\d)/, "\\1AT\\2"); puts class_name' "fe@${version}")

  # Check if the new filename already exists
  if [[ -e "${new_filename}" ]]
  then
    echo "File '${new_filename}' already exists."
  else
    # Rename the file
    mv "${input_file}" "${new_filename}"
    ruby -e 'path, class_name = ARGV; contents = File.read(path); contents.sub!(/^class\s+\w+\s+<\s+Formula$/, "class #{class_name} < Formula") or abort("Failed to update formula class name in #{path}"); contents.sub!(/^(  version ".*"\n(?:  version_scheme \d+\n)?)/, "\\1  keg_only :versioned_formula\n") or abort("Failed to mark #{path} as keg-only"); File.write(path, contents)' "${new_filename}" "${class_name}"
    echo "File renamed to '${new_filename}'."
  fi
else
  echo "Version not found in the file." >&2
  exit 1
fi
