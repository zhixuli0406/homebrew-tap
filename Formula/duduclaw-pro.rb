class DuduclawPro < Formula
  desc "DuDuClaw Pro — Commercial AI agent orchestration with industry templates & adaptive evolution"
  homepage "https://github.com/zhixuli0406/duduclaw-pro-releases"
  version "1.4.5"
  license :cannot_represent

  # Pre-built tarball from public release repo (binary + Python SDK)
  if Hardware::CPU.arm?
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-aarch64-apple-darwin.tar.gz"
    sha256 "b2a901bce6c2bc844f022e97b28debc13053a7a256589a8cf1786a97ce3b281a"
  else
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-x86_64-apple-darwin.tar.gz"
    sha256 "8be16d281b5d25ac47f80116e43c74f486c2b77b87e79fd523900d63922c7cf2"
  end

  depends_on :macos
  depends_on "python@3.12" => :recommended

  # Pro conflicts with CE — same port, same home directory
  conflicts_with "duduclaw", because: "both install a `duduclaw` gateway on port 18789"

  def install
    binary = Hardware::CPU.arm? ? "duduclaw-pro-aarch64-apple-darwin" : "duduclaw-pro-x86_64-apple-darwin"
    bin.install binary => "duduclaw-pro"
    # Python SDK — required for evolution vetter & SDK chat fallback
    (libexec/"python").install "python/duduclaw" if (buildpath/"python/duduclaw").exist?
  end

  def caveats
    <<~EOS
      🐾 DuDuClaw Pro v#{version}

      Without a license, Pro runs in Community mode (all core features, no limits).

      To activate Pro features:
        1. Purchase a license at https://duduclaw.dev/pricing
        2. Run: duduclaw-pro license activate '<your-license-key>'

      Quick start:
        duduclaw-pro onboard    # Interactive setup wizard
        duduclaw-pro run         # Start gateway + channels

      Dashboard: http://localhost:18789
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duduclaw-pro version")
  end
end
