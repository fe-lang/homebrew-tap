class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.2.0"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.2.0/fe_mac_arm64"
    sha256 "f6f8617912fcc8aa671a3ce48397e0d44c0a4ee43a085c886033d46d6c51328a"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.2.0/fe_mac_amd64"
    sha256 "ed173aec7c68a51f5b744f586e47ff66ef9fc57889437a35a748d560453d3a2e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.2.0/fe_linux_amd64"
    sha256 "bef1aaadf04d5cfba67491ffdebdfc287ddf845389df42c1e3685a89f9449b8e"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.2.0/fe_linux_arm64"
    sha256 "0038e343bc894e7aaf3ec6328da0b962800c8a8842d3cc1d27e4082c9740159e"
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
