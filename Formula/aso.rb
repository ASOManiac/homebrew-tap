# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.0.1/aso_0.0.1_macOS_arm64"
      sha256 "568f4a13710bb4add20a88469b6fe4ae27cecf06dbc02adae3f61e96509a9315"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.0.1/aso_0.0.1_macOS_amd64"
      sha256 "866c639f13bb12c36ac51b34ef11443843e902a66c0b43e77a0731ff3f0bbb13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.0.1/aso_0.0.1_linux_arm64"
      sha256 "c0e474294efc551dc9fe41a3a9800ddefd9e37a20c9fa9b864e04f7422d9bff7"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.0.1/aso_0.0.1_linux_amd64"
      sha256 "e8c5204a0afdcda255302e1654e95011a6effa03d7ba43bd611b3ad074bffed0"
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
