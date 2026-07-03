# typed: false
# frozen_string_literal: true

# Homebrew formula for CERT-X-GEN (cxg)
# A polyglot execution engine for vulnerability detection
class Cxg < Formula
  desc "Polyglot execution engine for vulnerability detection"
  homepage "https://github.com/Bugb-Technologies/cert-x-gen"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.1.1/cxg-darwin-amd64"
      sha256 "2f49c5678ba571511b1183483f1c219d242453a22cf68abfd04261eeff25aab3"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.1.1/cxg-darwin-arm64"
      sha256 "6af0cf7176675ec42702634e170d2da11388f15a03899a306b8bb8b18a7c71ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.1.1/cxg-linux-amd64"
      sha256 "667789c91f101d74929b19abdf023057a96b5ae43849b346bc1cf00635789f09"
    end
    on_arm do
      url "https://github.com/Bugb-Technologies/cert-x-gen/releases/download/v1.1.1/cxg-linux-arm64"
      sha256 "b1976065f25fc8dc8c04da29a5b070dde6f846ba1e99974c1e12639ade7eec6e"
    end
  end

  def install
    bin.install Dir["cxg-*"].first => "cxg"
  end

  def caveats
    <<~EOS
      To download vulnerability detection templates, run:
        cxg template update

      Templates will be installed to ~/.cert-x-gen/templates/
    EOS
  end

  test do
    assert_match "cxg", shell_output("#{bin}/cxg --version")
  end
end
