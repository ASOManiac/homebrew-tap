# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/#{version}/aso_#{version}_macOS_arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/#{version}/aso_#{version}_macOS_amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/#{version}/aso_#{version}_linux_arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/#{version}/aso_#{version}_linux_amd64"
      sha256 "PLACEHOLDER"
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
