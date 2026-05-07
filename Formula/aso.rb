# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.0/aso_2.0.0_macOS_arm64"
      sha256 "cc64c925e010e2f4ec0494335cb38047aaf0f19a3084970f9fb14646a03d58e4"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.0/aso_2.0.0_macOS_amd64"
      sha256 "8c98f92a73320b9b8f23cbdc387e5734ebbdae42e0afc79f52ac5be842917ef1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.0/aso_2.0.0_linux_arm64"
      sha256 "33ab0e8b51c0570c94d98d5f432edd9c2041204c82177924f45914d1ee6dd72f"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.0/aso_2.0.0_linux_amd64"
      sha256 "46d70622fee1b6c789b28a4750664c4d5a2c8154d83a73a76ebf331c10ac4dee"
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
