class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.5.1"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.5.1/fe_mac_arm64"
    sha256 "a28f2a6c0e3b902a0a98f4ef3e1af3e1701a143de269e52e30c0bdb422001d6f"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.5.1/fe_mac_amd64"
    sha256 "1af1d54fc9f044540887863118fb7b6b6369792305d4d0bdd50e5fe427f37d4f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.5.1/fe_linux_amd64"
    sha256 "2d48fd56e45f56a775bea73a3180ffcab73ad440887d0a985be2050fb5993916"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.5.1/fe_linux_arm64"
    sha256 "fb2410473aecb961532e855f5bb4688f288123457ab70425be4ae7f533d6fb75"
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
