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
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v#{version}/cxg-darwin-amd64"
      sha256 "PLACEHOLDER_DARWIN_AMD64_SHA256"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v#{version}/cxg-darwin-arm64"
      sha256 "PLACEHOLDER_DARWIN_ARM64_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v#{version}/cxg-linux-amd64"
      sha256 "PLACEHOLDER_LINUX_AMD64_SHA256"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v#{version}/cxg-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
  end

  def install
    binary_name = "cxg"
    
    # The downloaded file is the binary itself
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "cxg-darwin-arm64" => binary_name
      else
        bin.install "cxg-darwin-amd64" => binary_name
      end
    else
      if Hardware::CPU.arm?
        bin.install "cxg-linux-arm64" => binary_name
      else
        bin.install "cxg-linux-amd64" => binary_name
      end
    end
  end

  def post_install
    # Download templates on first install
    system bin/"cxg", "template", "update" rescue nil
  end

  test do
    assert_match "cxg", shell_output("#{bin}/cxg --version")
  end
end
