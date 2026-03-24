class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.4"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.4/duduclaw-v0.6.4-aarch64-apple-darwin.tar.gz"
  sha256 "ed3c6c6ffa5bb321daaf33ad8b719941379cc0d10d1f0b01c14fd4ccbd044105"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end