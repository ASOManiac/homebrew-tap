# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.0/aso_0.3.0_macOS_arm64"
      sha256 "58921c44c1f0262f9135877da2f808dcf4937c50e234d93388d5ebbd59939094"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.0/aso_0.3.0_macOS_amd64"
      sha256 "55671a0e23d2f89d777fc8bb9adbf1e45d8cc01caa40f5272ee7d84db419f991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.0/aso_0.3.0_linux_arm64"
      sha256 "6fa2c26a56964eac203a8bcd787aee89420376c5e73151b9774ee30a222c2b93"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.0/aso_0.3.0_linux_amd64"
      sha256 "48c24ef7ea147bc0775d170070dd8f1443151b023d1d080785ae26ae201f452e"
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
