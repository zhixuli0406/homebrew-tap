class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.3"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.3/duduclaw-v0.6.3-aarch64-apple-darwin.tar.gz"
  sha256 "28c5f17a8ca73254f6fa366dbc0274a61b1928f78637e730b54055960389b4d5"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end