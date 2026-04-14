#!/bin/bash

set -euo pipefail

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

# Run the first script to get the latest FE version
if [[ $# -eq 1 ]]
then
  latest_version=$1
else
  latest_version=$(./get-latest-fe-version.sh)
fi

# Run the second script to get the formula version
formula_version=$(./get-formula-version.sh)

# Compare the versions
if [[ "${latest_version}" != "${formula_version}" ]]
then
  echo "Versions differ: Latest version is ${latest_version}, Formula version is ${formula_version}"
  exit 0
else
  echo "Versions are the same: ${latest_version}"
  exit 1
fi
