class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.9.1"
  license "Elastic-2.0"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.9.1/duduclaw-v0.9.1-arm64-apple-darwin.tar.gz"
  sha256 "c5c522a18ac12b225de1b0e3fd9907478c21218cb9b0f08ce055a166e9d3273c"

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
