#!/bin/bash

set -euo pipefail

# Change the working directory to the script's directory
cd "$(dirname "$0")" || exit

if [ $# -ne 1 ]; then
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
  if ! curl -fLsS "$url" -o "$temp_file"; then
    rm -f "$temp_file"
    echo "Failed to download artifact: $url" >&2
    exit 1
  fi

  sha256=$(shasum -a 256 "$temp_file")
  rm -f "$temp_file"
  sha256="${sha256%% *}"

  if [ -z "$sha256" ]; then
    echo "Failed to compute sha256 for: $url" >&2
    exit 1
  fi

  echo "$sha256"
}

sha256_linux_amd64=$(sha256_from_url "$url_linux_amd64")
sha256_linux_arm64=$(sha256_from_url "$url_linux_arm64")
sha256_mac_amd64=$(sha256_from_url "$url_mac_amd64")
sha256_mac_arm64=$(sha256_from_url "$url_mac_arm64")


blueprint="class Fe < Formula
  desc \"Compiler for the Fe programming language\"
  homepage \"https://github.com/argotorg/fe\"

  if OS.mac? && Hardware::CPU.arm?
    url \"https://github.com/argotorg/fe/releases/download/v${version}/fe_mac_arm64\"
    sha256 \"${sha256_mac_arm64}\"
  end

  if OS.mac? && Hardware::CPU.intel?
    url \"https://github.com/argotorg/fe/releases/download/v${version}/fe_mac_amd64\"
    sha256 \"${sha256_mac_amd64}\"
  end

  if OS.linux? && Hardware::CPU.intel?
    url \"https://github.com/argotorg/fe/releases/download/v${version}/fe_linux_amd64\"
    sha256 \"${sha256_linux_amd64}\"
  end

  if OS.linux? && Hardware::CPU.arm?
    url \"https://github.com/argotorg/fe/releases/download/v${version}/fe_linux_arm64\"
    sha256 \"${sha256_linux_arm64}\"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install \"fe_mac_arm64\" => \"fe\"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install \"fe_mac_amd64\" => \"fe\"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install \"fe_linux_arm64\" => \"fe\"
    else
      bin.install \"fe_linux_amd64\" => \"fe\"
    end
  end
end
"

echo "$blueprint"
