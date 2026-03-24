class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.6.2"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.6.2/duduclaw-v0.6.2-aarch64-apple-darwin.tar.gz"
  sha256 "0327a1dcd0474a8224c8e36d2f13e1f8ba95a1fc8495c233fe7dcd8694caa5c7"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  def post_install
    ohai "Run `duduclaw onboard` to configure your API key and create your first agent"
    ohai "Then run `duduclaw run` to start the gateway"
    ohai "New: Odoo ERP integration — add [odoo] section to config.toml"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end
