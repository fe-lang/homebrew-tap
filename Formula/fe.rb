class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"
  version "26.4.1"
  version_scheme 1

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.4.1/fe_mac_arm64"
    sha256 "19d6c880bf44dd461defbd764593a516033d4c5300be60ad74094d7ade06b3cf"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.4.1/fe_mac_amd64"
    sha256 "f57b894adae1032551a0e6bfa1060073777ab06ed503a37c21261f98b626a2ee"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.4.1/fe_linux_amd64"
    sha256 "be186862a0df4998cfd9edf4618f29009a02c7b9a779d527b1bc7c54a038b3a0"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.4.1/fe_linux_arm64"
    sha256 "66644e57535555a62cbc9e9dba8871e93e50692f8747a3eac6cc1adfea31894e"
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
