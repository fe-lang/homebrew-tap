class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.8/fe_mac_arm64"
    sha256 "366e64cd074f25b7ad4fcf9a42d261d01872b7e4367f30ee8915b1db7fa16ea2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.8/fe_mac_amd64"
    sha256 "3ba2d73070d4cf47e8d55481ff0bf635179a3b09a8957d6357f4662de01eb33b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.8/fe_linux_amd64"
    sha256 "768f9e3afe19528e154fc384946fe1ac30d272a5bb7b36ba0c2b21b2c025ddb8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.8/fe_linux_arm64"
    sha256 "399fb16f8c3f2b55775e067baea9fe6df02ae2a9150c48e2e2e2dc3ba7c5b1e2"
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
