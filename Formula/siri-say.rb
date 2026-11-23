class SiriSay < Formula
  desc "Speak text with any macOS voice, including the Siri voices"
  homepage "https://github.com/marcomontalbano/siri-say"
  url "https://github.com/marcomontalbano/siri-say/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fc4fa3264231ebd98169ae79f070234e4f05ad15b43fba2405ae447baabfefbd"
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
