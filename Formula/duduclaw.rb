class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.9.5"
  license "Elastic-2.0"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.9.5/duduclaw-v0.9.5-arm64-apple-darwin.tar.gz"
  sha256 "0619850eeab62b967e6adcffc7ed533cd282b031eebc3cbb7f54e6e6da5a17c4"

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
