# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.0/aso_0.1.0_macOS_arm64"
      sha256 "81fdd4cc62b1c93dbb0740535405cbee3a0ea899a3ca87e69ace4403c4714870"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.0/aso_0.1.0_macOS_amd64"
      sha256 "71628eb9f4aa40189ca181f58f7de3a655ea04090572ef0512ed03e745da4fce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.0/aso_0.1.0_linux_arm64"
      sha256 "0e04be5e244ea8e3a062001c3f2db766772bee56a94ca9a071a3c0468cb3a576"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.0/aso_0.1.0_linux_amd64"
      sha256 "9fe511f988ac90655455402bd44b094b016cd365942f13a11feeb667f957388d"
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
