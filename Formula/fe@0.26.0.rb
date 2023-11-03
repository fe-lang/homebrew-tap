class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/ethereum/fe"

  if OS.mac?
    url "https://github.com/ethereum/fe/releases/download/v0.26.0/fe_mac"
    sha256 "9af396f07152be4c5e8ff4882191fefbde4457135064ec1e401da936d071fdce"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ethereum/fe/releases/download/v0.26.0/fe_amd64"
    sha256 "a740b2274ad787e8340a418cb76cc3ac8508c38f2eb49aa5adca6d4047b44703"
  end

  def install
    if OS.mac?
      bin.install "fe_mac" => "fe"
    else
      bin.install "fe_amd64" => "fe"
    end
  end
end

