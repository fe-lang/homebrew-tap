#!/bin/bash

if [ $# -ne 1 ]; then
  # If the script is invoked without version parameter, it will figure out the latest release automatically
  version=$(curl -s -L -o /dev/null -w %{url_effective} https://github.com/ethereum/fe/releases/latest | sed 's/.*tag\/v//')
else
  version=$1
fi

url_linux="https://github.com/ethereum/fe/releases/download/v${version}/fe_amd64"
url_mac="https://github.com/ethereum/fe/releases/download/v${version}/fe_mac"

sha256_linux=$(curl -Ls "$url_linux" | shasum -a 256 | awk '{print $1}')
sha256_mac=$(curl -Ls "$url_mac" | shasum -a 256 | awk '{print $1}')


blueprint="class Fe < Formula
  desc \"Compiler for the Fe programming language\"
  homepage \"https://github.com/ethereum/fe\"

  if OS.mac?
    url \"https://github.com/ethereum/fe/releases/download/v${version}/fe_mac\"
    sha256 \"${sha256_mac}\"
  end

  if OS.linux? && Hardware::CPU.intel?
    url \"https://github.com/ethereum/fe/releases/download/v${version}/fe_amd64\"
    sha256 \"${sha256_linux}\"
  end

  def install
    if OS.mac?
      bin.install \"fe_mac\" => \"fe\"
    else
      bin.install \"fe_amd64\" => \"fe\"
    end
  end
end
"

echo "$blueprint"