# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.1/aso_0.2.1_macOS_arm64"
      sha256 "c08e9d95dd364079ebde272bc6d83fffa0aeb719feab4afc43e87ac4f0a6f2aa"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.1/aso_0.2.1_macOS_amd64"
      sha256 "7552da1df9cc00db301cdcb312af5fc0ee0781678804e124085a8eeb7fdc39cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.1/aso_0.2.1_linux_arm64"
      sha256 "e927628c2098b2936f446c39bd920c5be8bfac9adc76b1d7e954592c909beaa1"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.1/aso_0.2.1_linux_amd64"
      sha256 "94aafba390c60426c9414b5f96fe97610392a87bbfc2d3be47de80c0765f2086"
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
