class FeAT2600Alpha5 < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.0.0-alpha.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.5/fe_mac_arm64"
    sha256 "2cdd45f8d2e33e6405fe9e96436df1b07f08dc3f0873acae7069cc0937af46fd"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.5/fe_mac_amd64"
    sha256 "9168dd6183812597859f16e63fb4a3001b3315bd793e70172b15b9a55e72fdf9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.5/fe_linux_amd64"
    sha256 "c4a798da735ef9ad3e76fdac1902e1cb28e5b5aadcab6a971679582f0f146ae8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0-alpha.5/fe_linux_arm64"
    sha256 "1ccc8bc6e5ad599de636c4cb51cac49cce2d34a3a9c262a3d67b681cb4815d89"
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
