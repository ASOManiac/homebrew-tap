# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.2/aso_0.3.2_macOS_arm64"
      sha256 "7b9f8748d8bcd965033fbebd8b4236ebe1e669679664b121d67a6baa95be247d"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.2/aso_0.3.2_macOS_amd64"
      sha256 "7c5b851f6f69cd7fa621d7fc973a3bbd25543f5fb2ab8132da6c55051737c310"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.2/aso_0.3.2_linux_arm64"
      sha256 "e0636dee47a4728f2369e7cfe30c252827674f5599f01c269e34e62eaed61a28"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.2/aso_0.3.2_linux_amd64"
      sha256 "4669220cb4a1c6f6d730b61c6c6e670e7f222e34386c9b0b569c3863b5ec5eee"
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
