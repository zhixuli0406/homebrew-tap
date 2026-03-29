class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "0.9.2"
  license "Elastic-2.0"

  url "https://github.com/zhixuli0406/DuDuClaw/releases/download/v0.9.2/duduclaw-v0.9.2-arm64-apple-darwin.tar.gz"
  sha256 "ff8c9468d41c44c0e5a80efb7a533ac78e5b6b3453c1e33ba64f03b9e38ee358"

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
