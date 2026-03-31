# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.1/aso_0.3.1_macOS_arm64"
      sha256 "fdabb7c57f02984324ffdd478ec1d79d955ee5661f1c7c0ac7f6c030f68f8b05"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.1/aso_0.3.1_macOS_amd64"
      sha256 "74d4a4b768b90ae6f1fd36128d601c87ff4a7a60c1e7dc25b34cf47f0f5ae398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.1/aso_0.3.1_linux_arm64"
      sha256 "9a1580c7d2046bddc8402a553740b63631136a80b3a92ef8538a066e2ef56add"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.1/aso_0.3.1_linux_amd64"
      sha256 "6c4f63b94fefef1c52261c8cc57835e1490cba8ac3b3a4bba830bd8be36d3ad3"
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
