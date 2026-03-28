class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.7.0"
  license "MIT"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.7.0/duduclaw-v0.7.0-aarch64-apple-darwin.tar.gz"
  sha256 "6ce3e9f9e1fd4a1a98d9926cf74e29188ab01fed75a1d9cdcf13c5d9b3388999"

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
