# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - keyword intelligence for the App Store"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.1.0/aso_2.1.0_macOS_arm64"
      sha256 "f0814df54b3ea29ea6dbba2cd9e302996f2405e70b3bac839eb201a5aae86df6"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.1.0/aso_2.1.0_macOS_amd64"
      sha256 "f940b8cf0839575b68bb5b8529ade09d13197f0996707cb805dae417df8bc11b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.1.0/aso_2.1.0_linux_arm64"
      sha256 "1884665b4e41a4c73f75a4107c44b94ec1352964770479b666be5b71d80d4eef"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/2.1.0/aso_2.1.0_linux_amd64"
      sha256 "901aa83a5451713de6698cd00c3a4bdfdb2a1bce7e1851cc3b3b5c8965198a52"
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
