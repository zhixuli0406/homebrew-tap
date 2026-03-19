class Duduclaw < Formula
  desc "Multi-Agent AI Assistant Platform powered by Claude Code"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.5.0"
  license "MIT"

  # Pre-built binary for macOS Apple Silicon (arm64)
  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.5.0/duduclaw-v0.5.0-aarch64-apple-darwin.tar.gz"
  sha256 "5bf0f694a8bcb9850f0c86c86db667daa00f71618036dc7527d767b042bc170a"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  def post_install
    ohai "Run `duduclaw onboard` to configure your API key and create your first agent"
    ohai "Then run `duduclaw run` to start the gateway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end
