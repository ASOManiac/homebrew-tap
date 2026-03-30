# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.4/aso_0.2.4_macOS_arm64"
      sha256 "12d652e615d7183c8912689bdd58f761698ef650256193aca78239bf4e0c70f0"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.4/aso_0.2.4_macOS_amd64"
      sha256 "44ba4192573b25648fce7923dcc34fb7532b553414176b8cc9431594a3b6f01e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.4/aso_0.2.4_linux_arm64"
      sha256 "b2ba8a9aedc1cd01256b66c642fde9c23cdc37c973698a4313aa99e13ae51069"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.2.4/aso_0.2.4_linux_amd64"
      sha256 "61f0220828676951e2dd15ec134bd51d8b1ca5d5693607dfd395b91ebd42db3e"
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
