class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.1.0"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.1.0/fe_mac_arm64"
    sha256 "3ccffbf88537224e3bb2e4662627edc22bdedfc28e3351dec61e588eb87af0d8"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.1.0/fe_mac_amd64"
    sha256 "b5a5ed8fc7fdf696d1b76944384cfd242fc6359b3f77051cae83e4e49ab344d8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.1.0/fe_linux_amd64"
    sha256 "e179c7a4b1a913011b4919db38f915d860b8dedd23d8f81a4906d2b0c548e440"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.1.0/fe_linux_arm64"
    sha256 "bff9d74023fd18b6ab211ee73fde8a8ea9207dabd1d24de2b96af1c8900ce721"
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
