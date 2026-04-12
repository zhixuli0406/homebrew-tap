class DuduclawPro < Formula
  desc "DuDuClaw Pro — Commercial AI agent orchestration with industry templates & adaptive evolution"
  homepage "https://github.com/zhixuli0406/duduclaw-pro-releases"
  version "1.4.7"
  license :cannot_represent

  # Pre-built tarball from public release repo (binary + Python SDK)
  if Hardware::CPU.arm?
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-aarch64-apple-darwin.tar.gz"
    sha256 "50c376c74700f92d40ef6aeeb92d45fc73f3e0e3608f96c3cfc30c166aab82e0"
  else
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-x86_64-apple-darwin.tar.gz"
    sha256 "3fba052ad7c4b024febd41718523412f85ea3ac6d1fec60919d20cb30521e8ba"
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
