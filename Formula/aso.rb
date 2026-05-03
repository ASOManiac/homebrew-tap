# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.4.2/aso_0.4.2_macOS_arm64"
      sha256 "b0820806ef00b8ae08a89b063472b7186233c950dfadb4c67d766e846be5e086"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.4.2/aso_0.4.2_macOS_amd64"
      sha256 "e837954235762818f256378375755c8920087bcfa89de52a42e7cb0693b2db32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.4.2/aso_0.4.2_linux_arm64"
      sha256 "6a8161e8bf91a4bff09d51cb638758d1de3625f470614c93d39891865b8b5cd5"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.4.2/aso_0.4.2_linux_amd64"
      sha256 "d3d096b64fcbb64d8b47f3aa955a348e3d658827899bd2e13b5979ff61cbcc3e"
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
