class Duduclaw < Formula
  desc "Multi-Agent AI Assistant Platform powered by Claude Code"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.5.1"
  license "MIT"

  # Pre-built Apple Silicon (arm64) binary
  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.5.1/duduclaw-v0.5.1-aarch64-apple-darwin.tar.gz"
  sha256 "e462760385163cc0c2f65153eb113d4c39fd3fc5f1590fd2a442d715c0631f78"

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
