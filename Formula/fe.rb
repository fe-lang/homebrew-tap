class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.6.0"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.6.0/fe_mac_arm64"
    sha256 "de045cf2ccd5a4052d92cde7745ff052747235b9c98e745a0995a8ad40a0c78e"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.6.0/fe_mac_amd64"
    sha256 "d9330215915347c95e1fb8f6c0bf2f54e76faeb90db57176d4fe2a57c9f25267"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.6.0/fe_linux_amd64"
    sha256 "697081cb9265bd1be7a5d33e6bb0c8559ee5ff542abab9a046540fc151b4edaa"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.6.0/fe_linux_arm64"
    sha256 "011caa8a297763b3c1540048beb92bea047f0868eabe0ea1b4822e99d945fe26"
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
