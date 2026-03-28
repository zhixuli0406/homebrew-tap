class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.8.12"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.8.12/duduclaw-v0.8.12-aarch64-apple-darwin.tar.gz"
  sha256 "0ce3b2ad10eff5435dfd9b1b1f2cbe0c5a5921253c007be656d55336da78d4d3"

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
