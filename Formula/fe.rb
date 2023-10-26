class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/ethereum/fe"

  if OS.mac?
    url "https://github.com/ethereum/fe/releases/download/v0.25.0/fe_mac"
    sha256 "83fa7f49d9bf391c3ec4bd9d98eca5895d9f3c0c0c2f3a8cc12507d2a0bf7107"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ethereum/fe/releases/download/v0.25.0/fe_amd64"
    sha256 "90baa077ba6563ea8106b3cd6a28b6307ef320dfc38a3acb11594856ff61c6be"
  end

  def install
    if OS.mac?
      bin.install "fe_mac" => "fe"
    else
      bin.install "fe_amd64" => "fe"
    end
  end
end

