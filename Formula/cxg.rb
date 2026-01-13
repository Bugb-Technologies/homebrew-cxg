# typed: false
# frozen_string_literal: true

# Homebrew formula for CERT-X-GEN (cxg)
# A polyglot execution engine for vulnerability detection
class Cxg < Formula
  desc "Polyglot execution engine for vulnerability detection"
  homepage "https://github.com/Bugb-Technologies/cert-x-gen"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.0.0/cxg-darwin-amd64"
      sha256 "b586e7d572a2a4b410e2da619a042f31a571e949ffe140f52f0dc8d408478124"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.0.0/cxg-darwin-arm64"
      sha256 "91072f15f261afab64fe095bb8006557306069310fd6f02703a3f88aa91636ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.0.0/cxg-linux-amd64"
      sha256 "a094054355f04990d8beb242ed42a057df673d1d9ddd6d6a4fca11eae78be52a"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.0.0/cxg-linux-arm64"
      sha256 "6fe3604f6d05a4b8e679a21854d5f2cd151ae2a801cdd99f27aea96520cb3946"
    end
  end

  def install
    bin.install Dir["cxg-*"].first => "cxg"
  end

  def post_install
    system bin/"cxg", "template", "update" rescue nil
  end

  test do
    assert_match "cxg", shell_output("#{bin}/cxg --version")
  end
end
