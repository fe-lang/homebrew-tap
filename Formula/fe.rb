class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/ethereum/fe"
  version "0.22.0"

  # TODO: arm builds: `&& Hardware::CPU.arm?` vs `Hardware::CPU.intel`
  if OS.mac?
    url "https://github.com/ethereum/fe/releases/download/v#{version}/fe_mac"
    sha256 "14653563e096c348cafb083b793430ed0779ef6baaee84318bad10346af8048a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ethereum/fe/releases/download/v#{version}/fe_amd64"
    sha256 "47527cd4b12d12d17ed32de7edbefc913e9eab12f4097b3ab62c311e25e63cdb"
  end

  def install
    if OS.mac?
      bin.install "fe_mac" => "fe"
    else
      bin.install "fe_amd64" => "fe"
    end
  end
end
