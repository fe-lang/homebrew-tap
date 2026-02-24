#!/bin/bash

set -euo pipefail

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

if [[ $# -ne 1 ]]
then
  # If the script is invoked without version parameter, it will figure out the latest release automatically
  version=$(./get-latest-fe-version.sh)
else
  version=$1
fi

url_linux_amd64="https://github.com/argotorg/fe/releases/download/v${version}/fe_linux_amd64"
url_linux_arm64="https://github.com/argotorg/fe/releases/download/v${version}/fe_linux_arm64"
url_mac_amd64="https://github.com/argotorg/fe/releases/download/v${version}/fe_mac_amd64"
url_mac_arm64="https://github.com/argotorg/fe/releases/download/v${version}/fe_mac_arm64"

sha256_from_url() {
  local url="$1"
  local temp_file
  local sha256

  temp_file=$(mktemp)
  if ! curl -fLsS "${url}" -o "${temp_file}"
  then
    rm -f "${temp_file}"
    echo "Failed to download artifact: ${url}" >&2
    exit 1
  fi

  sha256=$(shasum -a 256 "${temp_file}")
  rm -f "${temp_file}"
  sha256="${sha256%% *}"

  if [[ -z "${sha256}" ]]
  then
    echo "Failed to compute sha256 for: ${url}" >&2
    exit 1
  fi

  echo "${sha256}"
}

sha256_linux_amd64=$(sha256_from_url "${url_linux_amd64}")
sha256_linux_arm64=$(sha256_from_url "${url_linux_arm64}")
sha256_mac_amd64=$(sha256_from_url "${url_mac_amd64}")
sha256_mac_arm64=$(sha256_from_url "${url_mac_arm64}")

sed \
  -e "s/__VERSION__/${version}/g" \
  -e "s/__SHA256_MAC_ARM64__/${sha256_mac_arm64}/g" \
  -e "s/__SHA256_MAC_AMD64__/${sha256_mac_amd64}/g" \
  -e "s/__SHA256_LINUX_AMD64__/${sha256_linux_amd64}/g" \
  -e "s/__SHA256_LINUX_ARM64__/${sha256_linux_arm64}/g" \
  formula.rb.template
