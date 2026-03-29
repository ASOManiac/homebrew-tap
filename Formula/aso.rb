# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.1/aso_0.1.1_macOS_arm64"
      sha256 "12bfbf303f73ef59a06ebc9db3460c0d7de77518e636bc9468992cd519bcbc58"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.1/aso_0.1.1_macOS_amd64"
      sha256 "c54593f121ad5d9d2f0624c9a77ab205782d486f00cdd6024fc39064f63e6518"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.1/aso_0.1.1_linux_arm64"
      sha256 "06a0ff5ee15da69619b0504c10dc9b6e3ca1d1899b53e59d4626648648b39cbe"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.1.1/aso_0.1.1_linux_amd64"
      sha256 "2629bd846125466a76c3b9b8acbad103e5e59ccd6daf019a41cb9661e17ac1c2"
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
