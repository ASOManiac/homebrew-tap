# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.1/aso_0.5.1_macOS_arm64"
      sha256 "bb9ed9ab25b28e87a7196c93b97c80b03b8c9fa81217c8c26e0b5a4f927a7bc4"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.1/aso_0.5.1_macOS_amd64"
      sha256 "08161785211cf5612b76b4fb0e50446bb77b3065d8d749450ee5aa449099596c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.1/aso_0.5.1_linux_arm64"
      sha256 "c6fe47d716ec9c7c6ea4cffc44836cfe0c03a44e4b4b8ff3ced5b4907e73a1de"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.5.1/aso_0.5.1_linux_amd64"
      sha256 "222e01e746112a1d273443eb65aa12f8131e2174154b3a8763f0e2e360e06018"
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
