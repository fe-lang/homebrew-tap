class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.5.0"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.5.0/fe_mac_arm64"
    sha256 "4968711c5bc02c1a3151cfaea0d81a48dc74803ea208362022af467c2a523fed"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.5.0/fe_mac_amd64"
    sha256 "551a635be33013239a2fcefdbe5372f23b23fa998d32a98d15ef40cd5aeab3b3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.5.0/fe_linux_amd64"
    sha256 "3732fbe8a6e9d2ea3925d02d0e3a1478bc1e01d742c2be75d3ea7300c46c45f0"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.5.0/fe_linux_arm64"
    sha256 "ccd600ed1e532e327612ccd06f74890f54f0d5b39d1f4eb95d3dde0934022fa7"
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
