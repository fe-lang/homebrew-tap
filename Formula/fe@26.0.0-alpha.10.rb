class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.10/fe_mac_arm64"
    sha256 "116f134514d0b0eea6a4eca786e161ca6476ff7a1a4c59f984115ab90c3e092a"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.10/fe_mac_amd64"
    sha256 "f01a83aa8baef1a220866a1c8dbf0fa0152f138b6c6c0a19a88a3b51711d0e90"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.10/fe_linux_amd64"
    sha256 "cde345520f35984c3a0aa79341b19f1bcafbfcdbf93528740f4bae4f565ea5a6"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.10/fe_linux_arm64"
    sha256 "296434d2cbde93b2ae0a2775019fbd20d44225bd81ae51a2b4d59ad8feb08754"
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
