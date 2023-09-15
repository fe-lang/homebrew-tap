class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/ethereum/fe"

  if OS.mac?
    url "https://github.com/ethereum/fe/releases/download/v0.24.0/fe_mac"
    sha256 "a6529f56ad32ed67f387ef85d7fe84f87d302ac12474f8fda93a442836f5073f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ethereum/fe/releases/download/v0.24.0/fe_amd64"
    sha256 "19a5fb1d9c92302f75a5e1c39f3a47df9c037fd69fc75bb2d5e78823a34ccd36"
  end

  def install
    if OS.mac?
      bin.install "fe_mac" => "fe"
    else
      bin.install "fe_amd64" => "fe"
    end
  end
end
