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
      sha256 "bbac1cfb789fd7d40f29555278179d7e552f447d9f164407cd1a1d2d535690db"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.0.0/cxg-linux-arm64"
      sha256 "89273eda15539849bfabff116e62d93d0cb906a0849fb32de4c59db90dc766bc"
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
