class FeAT2600Alpha9 < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.0.0-alpha.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.9/fe_mac_arm64"
    sha256 "0c56dcb3960c5156d87fd5eada6dca8d55986022946f1c5988ad1c69019734ca"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.9/fe_mac_amd64"
    sha256 "9d1fd631e6261ad3ccb92ccb6fb27b5ed297a9c8347729bbaec385eb8683c6a4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.9/fe_linux_amd64"
    sha256 "25d0639ebc4219ead2685f74f114084420ec70da0d0921190c0c66bf5b400c04"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.9/fe_linux_arm64"
    sha256 "1a777c7dc9146c7b2b3d5ba79850bba41bf46be0f3c7f5bf9d07eb74c9a2e3b9"
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
