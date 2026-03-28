class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.8.9"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.8.9/duduclaw-v0.8.9-aarch64-apple-darwin.tar.gz"
  sha256 "02e7490f6948930b3d2d1d06dfc40a8f72e0ebd2a4c8760719d6b0d442e192b0"

  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    bin.install "duduclaw"
  end

  def caveats
    <<~EOS
      To enable local LLM inference:
        1. Place GGUF models in ~/.duduclaw/models/
        2. Copy inference.toml.example to ~/.duduclaw/inference.toml
        3. Set `enabled = true` in inference.toml

      Run `duduclaw onboard` to set up your AI assistant.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw --version")
  end
end
