#!/bin/bash

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

  # Check if the new filename already exists
  if [[ -e "${new_filename}" ]]
  then
    echo "File '${new_filename}' already exists."
  else
    # Rename the file
    mv "${input_file}" "${new_filename}"
    echo "File renamed to '${new_filename}'."
  fi
else
  echo "Version not found in the file."
fi
