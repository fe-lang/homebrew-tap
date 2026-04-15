class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.0.1"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.1/fe_mac_arm64"
    sha256 "3c522365f498e008bd43d33ee7193a2c4ed1e66f1d7199fe91c3d2f0e202658e"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.1/fe_mac_amd64"
    sha256 "91fe6a27050545af5c0f83b4d2cea949cf1c38f3edc8ed854a418574102df083"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.1/fe_linux_amd64"
    sha256 "a6f7a8740135fd330062b57d05970ee2ee4dda57b2e31cace2268015d9f954ad"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.1/fe_linux_arm64"
    sha256 "56373d4ebceb94887be1e32d1c07712ae40730a9bcfa9fff445e347cca104446"
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
