#!/bin/bash

file_path="../Formula/fe.rb"

# Extract version using grep and awk
version=$(grep -o 'version "[^"]*' "$file_path" | awk -F'"' '{print $2}')
echo $version