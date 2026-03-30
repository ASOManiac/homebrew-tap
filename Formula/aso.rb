# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.2/aso_0.2.2_macOS_arm64"
      sha256 "28c5d378b7409ca9fb446be188200c3e4f7b41b36d12076fd19398c48cf4e289"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.2/aso_0.2.2_macOS_amd64"
      sha256 "33eaf76c5a4e87ee8effd393c05e513f679c43d94178568e5e88be153fbf7018"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.2/aso_0.2.2_linux_arm64"
      sha256 "636a8362af67610332f4f5fa1ea1b7477c1b42a9ebd3c124d1afff59c59e5dcf"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.2/aso_0.2.2_linux_amd64"
      sha256 "5076c94d1c3522ee08763c4426f572021aa785ba2dbd461d9a7da84e6d524bcf"
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
