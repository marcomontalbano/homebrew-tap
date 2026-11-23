class SiriSay < Formula
  desc "Speak text with any macOS voice, including the Siri voices"
  homepage "https://github.com/marcomontalbano/siri-say"
  url "https://github.com/marcomontalbano/siri-say/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8792fbb15ae21a849576d05588de562d44ce8b375d27b0314ad43e403d4858bf"
  license "MIT"

  depends_on :macos

  # Installed as the interpreted script, not built: the Siri voices are only
  # exposed to Apple-signed processes, so a compiled binary cannot use them.
  def install
    bin.install "Sources/siri-say/main.swift" => "siri-say"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/siri-say --version")
  end
end
