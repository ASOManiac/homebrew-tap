# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.0/aso_0.5.0_macOS_arm64"
      sha256 "88e09d20cc89870aa15aeb40fde0c23dbcf78bbfb20d47f6d3f0e573812af5d9"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.0/aso_0.5.0_macOS_amd64"
      sha256 "987e7475c92fc3c7d7233f66f3774dbd5dc6abf09c0d0fc9be757c675c8142a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.0/aso_0.5.0_linux_arm64"
      sha256 "1038784e0ac21cb6b084815af80abc0619c9279f2a06b6bd71fedf184c0016e8"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.0/aso_0.5.0_linux_amd64"
      sha256 "07053146e6ad66e47a4090fe022fbe745b44ac5ea1d0a6e74b81a45eb6df704c"
    end
  end

  def install
    binary = Dir["aso_*"].first || Dir["aso"].first
    bin.install binary => "aso"
  end

  test do
    assert_match "ASO CLI", shell_output("#{bin}/aso --help")
  end
end
