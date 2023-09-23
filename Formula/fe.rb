class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/ethereum/fe"

  if OS.mac?
    url "https://github.com/ethereum/fe/releases/download/vnull/fe_mac"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ethereum/fe/releases/download/vnull/fe_amd64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    if OS.mac?
      bin.install "fe_mac" => "fe"
    else
      bin.install "fe_amd64" => "fe"
    end
  end
end

