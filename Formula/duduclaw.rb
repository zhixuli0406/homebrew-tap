class Duduclaw < Formula
  desc "Claude Code Extension Layer — multi-channel AI agent orchestration with local LLM inference"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "1.3.3"
  license "Apache-2.0"

  url "https://github.com/zhixuli0406/DuDuClaw.git", tag: "v1.3.3", revision: "a16423496e98ea30dfcacb20015082a0f2db7f4d"

  depends_on "rust" => :build
  depends_on "node" => :build
  depends_on :macos
  depends_on "python@3.12" => :recommended

  def install
    cd "web" do
      system "npm", "ci", "--legacy-peer-deps"
      system "npm", "run", "build"
    end

    ENV["DUDUCLAW_LICENSE_PUBKEY_HEX"] = "1aab166201a0598f00cebae2149af361cbb024862567ec21ff97fe2dd31fda5d"
    system "cargo", "build", "--release", "-p", "duduclaw-cli",
           "-p", "duduclaw-gateway", "--features", "duduclaw-gateway/dashboard"
    bin.install "target/release/duduclaw"
  end

  def caveats
    <<~EOS
      🐾 DuDuClaw v#{version} — Claude Code Extension Layer

      Quick start:
        duduclaw onboard    # Interactive setup wizard
        duduclaw run         # Start gateway + channels

      Dashboard: http://localhost:18789

      For local LLM inference:
        1. Place GGUF models in ~/.duduclaw/models/
        2. Edit ~/.duduclaw/inference.toml
        3. Set `enabled = true`

      Docs: https://github.com/zhixuli0406/DuDuClaw
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw version")
  end
end
