class FeAT2600Rc0 < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.0.0-rc0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-rc0/fe_mac_arm64"
    sha256 "6df3eda4c0ce6871b152ed02c2b19ecebf52ce0e4e318c18907aff3b481a5680"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-rc0/fe_mac_amd64"
    sha256 "b8a6caf41bec9bea1d2847e409a5730bd29280df4c59bd88a7487ed21a94c2d0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-rc0/fe_linux_amd64"
    sha256 "e41453f111ecba28f8457314b2405aaa414c22ac264ae5e0c693864807ad126b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-rc0/fe_linux_arm64"
    sha256 "48efe8afa64cc92165f8157cbd95b649f8f7d32d0391897301801e72bcb023d3"
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
