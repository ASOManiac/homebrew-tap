# typed: false
# frozen_string_literal: true

class Aso < Formula
  desc "ASO CLI - App Store Optimization + App Store Connect"
  homepage "https://github.com/ASOManiac/aso-cli"
  license "MIT"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.3/aso_0.3.3_macOS_arm64"
      sha256 "e52767cb02f984cd1ff94b05fd21e65bb9f786e3deb7d44c03936dedffeac42e"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.3/aso_0.3.3_macOS_amd64"
      sha256 "760b7f84e3c9559c78ad44ff0079f49a3a04a3e87dfa65351527925c81de494a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.3/aso_0.3.3_linux_arm64"
      sha256 "553b451d1f3d8ea327d0351cea38f9856dbd13940f4733aa53b85f834d1237cc"
    else
      url "https://github.com/ASOManiac/aso-cli/releases/download/0.3.3/aso_0.3.3_linux_amd64"
      sha256 "8bfc5973bc7d42e2e2f2ed379744c19ea858da338c12e3cdd640549da01e31e1"
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
