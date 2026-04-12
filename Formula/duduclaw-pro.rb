class DuduclawPro < Formula
  desc "DuDuClaw Pro — Commercial AI agent orchestration with industry templates & adaptive evolution"
  homepage "https://github.com/zhixuli0406/duduclaw-pro-releases"
  version "1.4.6"
  license :cannot_represent

  # Pre-built tarball from public release repo (binary + Python SDK)
  if Hardware::CPU.arm?
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-aarch64-apple-darwin.tar.gz"
    sha256 "1b06c15090fbfb742b66f632d5f1d5f0440c5cb21d15ec64e7f290366d5f8390"
  else
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-x86_64-apple-darwin.tar.gz"
    sha256 "49bade43fbd41b9b32312cf7350ba3e0854cd9c65f03ab3a438c44763ec30d3a"
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
