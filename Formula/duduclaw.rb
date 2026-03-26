class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.6"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.6/duduclaw-v0.6.6-aarch64-apple-darwin.tar.gz"
  sha256 "f1532eb5c3553996727d3c6406b39204bdce093aee4e98efc529f7409b951fb8"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end