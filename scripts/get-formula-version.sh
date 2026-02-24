#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

file_path="../Formula/fe.rb"

# Extract version using grep
version=$(grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+[^/]*' "${file_path}" | head -n 1 | sed 's/v//' || true)
echo "${version}"
