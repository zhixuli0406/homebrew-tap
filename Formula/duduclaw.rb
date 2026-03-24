class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.5"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.5/duduclaw-v0.6.5-aarch64-apple-darwin.tar.gz"
  sha256 "75535935ecc9e17ab6c539e01ef898c9597a1e080f9804998de3a1960bc0f43b"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end