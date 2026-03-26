class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.6"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.6/duduclaw-v0.6.6-aarch64-apple-darwin.tar.gz"
  sha256 "beb70a90aab398fb8fd8ef24a782beb9ed468653dc1250d748e2375f692f2eb1"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end