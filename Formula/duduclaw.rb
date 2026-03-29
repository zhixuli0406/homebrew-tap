class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.8.15"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.8.15/duduclaw-v0.8.15-x86_64-apple-darwin.tar.gz"
  sha256 "5ebf1a106bf63b7405c3e2c9e66244653b06e3ce5f1e682f732ed2f7087fde38"

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
