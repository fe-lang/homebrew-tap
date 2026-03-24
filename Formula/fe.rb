class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.12/fe_mac_arm64"
    sha256 "34ee252e0ee66b5db5e5b64574e6ffbe3f4ddd6c76bad99fb4f89af9e0974705"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.12/fe_mac_amd64"
    sha256 "97116277bf1d0fedb5bed6ac15e0fcd92a67bdb21b6c4adca70b8c5113e5a8f2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.12/fe_linux_amd64"
    sha256 "8a6ae3d28d21ddc82f35e058365cbf8f13d3f6a07aeadb40c7a73b48b230e043"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.12/fe_linux_arm64"
    sha256 "c438c7b74446dbff14ba4993ff844a6767b3b6d14af9e33ae924ebe5f510092d"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "fe_mac_arm64" => "fe"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "fe_mac_amd64" => "fe"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "fe_linux_arm64" => "fe"
    else
      bin.install "fe_linux_amd64" => "fe"
    end
  end
end
