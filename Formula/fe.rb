class Fe < Formula
  desc "Compiler for the Fe programming language"
  homepage "https://github.com/argotorg/fe"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0/fe_mac_arm64"
    sha256 "51b36887089037bf7477b7569ceda79822e2d18d27e876d2f62d35a51664a4f9"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0/fe_mac_amd64"
    sha256 "8d417f90ed5846060ee282a1416da9e219c26a0c9d297fd2ea355aabbc5cb345"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0/fe_linux_amd64"
    sha256 "98260570180a94e5215b48ce65451243d6d68e8652b11eb4bf0cc0ca294be1b9"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/argotorg/fe/releases/download/v26.0.0/fe_linux_arm64"
    sha256 "cbb5329615d32e79d5c6cd351a3f9b488270a51fbab465f0ab83f76f8e02acfe"
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
