# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.3/aso_0.2.3_macOS_arm64"
      sha256 "61206eeae0efaeec2aac9f8aada4dd2595ce9936879e56e298348ecf6ea2564d"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.3/aso_0.2.3_macOS_amd64"
      sha256 "d3705e265763315b59020487ea1c56a8adaba915c6f5ae3ddd922803285a1a16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.3/aso_0.2.3_linux_arm64"
      sha256 "7f47db87758c96ce7ff2ada9bab2ed612d69d84211b91221d560c611bd93bd77"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.3/aso_0.2.3_linux_amd64"
      sha256 "ff18abd56f491f38767acd69cd85660c8c7aa4088f291f05403a5c228a694714"
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
