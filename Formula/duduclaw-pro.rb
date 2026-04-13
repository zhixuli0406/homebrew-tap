class DuduclawPro < Formula
  desc "DuDuClaw Pro — Commercial AI agent orchestration with industry templates & adaptive evolution"
  homepage "https://github.com/zhixuli0406/duduclaw-pro-releases"
  version "1.4.17"
  license :cannot_represent

  # Pre-built tarball from public release repo (binary + Python SDK)
  if Hardware::CPU.arm?
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-aarch64-apple-darwin.tar.gz"
    sha256 "1fcad81ff0353bf8bc2df104a0c17af15701a87aefb2269b3a306d67179ed05d"
  else
    url "https://github.com/zhixuli0406/duduclaw-pro-releases/releases/download/v#{version}/duduclaw-pro-x86_64-apple-darwin.tar.gz"
    sha256 "497cf6deda26f10aeb1f6b44a0aedb0d1e5119531df8066a25f82e1ab1aff7a8"
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
      DuDuClaw Pro v#{version}

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
