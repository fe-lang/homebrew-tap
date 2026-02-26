#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

# Define your GitHub repository owner and name
repo_owner="argotorg"
repo_name="fe"

# Make the API request and store the response in a variable
# Use /releases (not /releases/latest) to include pre-releases
response=$(curl -s "https://api.github.com/repos/${repo_owner}/${repo_name}/releases")

# Extract the name of the most recent release (first entry)
if name=$(echo "${response}" | jq -r ".[0].name")
then
  # Remove a leading "v" from the name (if present)
  name_without_v="${name#v}"

  # Print the modified name
  echo "${name_without_v}"
else
  echo "Failed to fetch latest release."
  exit 1
fi
