#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

file_path="../Formula/fe.rb"

# Extract version from the explicit formula version declaration
version=$(grep -E '^[[:space:]]*version "' "${file_path}" | head -n 1 | sed -E 's/^[[:space:]]*version "([^"]+)".*/\1/' || true)
echo "${version}"
