#!/bin/bash

# Change the working directory to the script's directory
cd $(dirname "$0") || exit

# Define your GitHub repository owner and name
repo_owner="ethereum"
repo_name="fe"

# Make the API request and store the response in a variable
response=$(curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest")

# Check if the request was successful (HTTP status code 200)
if [[ $? -eq 0 ]]; then
  # Extract the "name" field from the JSON response
  name=$(echo "$response" | jq -r ".name")

  # Remove a leading "v" from the name (if present)
  name_without_v="${name#v}"

  # Print the modified name
  echo $name_without_v
else
  echo "Failed to fetch latest release."
  exit 1
fi
