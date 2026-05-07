# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - keyword intelligence for the App Store"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.1/aso_2.0.1_macOS_arm64"
      sha256 "0d798fa4e8178554410911d973e8539d4cd91b1687c90f542691992035c1c6b9"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.1/aso_2.0.1_macOS_amd64"
      sha256 "2c9c26276a3bb8af502648534871e0441c6e7c53ea29dfea40a8f36bf61027fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.1/aso_2.0.1_linux_arm64"
      sha256 "03fda3e11d74222b44aaf5d137284a98adeb492ca3859aea7a308de56443a01f"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.0.1/aso_2.0.1_linux_amd64"
      sha256 "447582112c4cf33f6759823cdfb6762debe60775a4c17c02187f8407db9f584a"
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
