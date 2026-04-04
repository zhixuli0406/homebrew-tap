class DuduclawBeta < Formula
  desc "Claude Code Extension Layer — v1.2.0-beta.1 (per-agent bots + prediction hardening)"
  homepage "https://github.com/zhixuli0406/DuDuClaw"
  version "1.2.0-beta.1"
  license "Elastic-2.0"

  url "https://github.com/zhixuli0406/DuDuClaw.git", branch: "release/v1.2.0-beta.1"

  depends_on "rust" => :build
  depends_on "node" => :build
  depends_on :macos
  depends_on "python@3.12" => :recommended

  conflicts_with "duduclaw", because: "both install a `duduclaw` binary"

  def install
    cd "web" do
      system "npm", "ci", "--legacy-peer-deps"
      system "npm", "run", "build"
    end

    system "cargo", "build", "--release", "-p", "duduclaw-cli",
           "-p", "duduclaw-gateway", "--features", "duduclaw-gateway/dashboard"
    bin.install "target/release/duduclaw"
  end

  def caveats
    <<~EOS
      DuDuClaw v1.2.0-beta.1

      New in this beta:
        - Per-agent Discord/Telegram/Slack bot support
        - Per-agent channel config & removal from dashboard
        - FeedbackSeverity grading (replaces binary correction counting)
        - Vocabulary novelty fallback (Tier 2 topic detection)
        - Evolution event logging (Sutskever Day 1 principle)
        - Epsilon-floor forced exploration (anti-dark-room)
        - Anti-sycophancy detection
        - CUSUM adaptive recalibration
        - Cultural context for zh-TW

      Quick start:
        duduclaw onboard    # Interactive setup wizard
        duduclaw serve      # Start gateway

      To switch back to stable:
        brew uninstall duduclaw-beta
        brew install duduclaw
    EOS
  end

  test do
    assert_match "duduclaw", shell_output("#{bin}/duduclaw version")
  end
end
