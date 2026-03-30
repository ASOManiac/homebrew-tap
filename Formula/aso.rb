# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.0/aso_0.2.0_macOS_arm64"
      sha256 "c1c2eb035f2b7ea7337e027e00cd6463b4174e8460d17ff5204d24f5df65a866"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.0/aso_0.2.0_macOS_amd64"
      sha256 "cabe3e36ba3b4d5d7ced31067f6707e5e60bd51747f20447ff8780358b918b80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.0/aso_0.2.0_linux_arm64"
      sha256 "5f8224fef9d5e3d15d85f4fdd45f70df363de323de97e04a92abc3f67f05d4b2"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.0/aso_0.2.0_linux_amd64"
      sha256 "9c6384c535666be5ca31466a3f1cb14d2c0a22adaec9671282413effb4911745"
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
