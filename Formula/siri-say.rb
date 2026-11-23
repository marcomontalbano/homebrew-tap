class SiriSay < Formula
  desc "Speak text with any macOS voice, including the Siri voices"
  homepage "https://github.com/marcomontalbano/siri-say"
  url "https://github.com/marcomontalbano/siri-say/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "2f98f067da3f955826de8fd1f1d66ba765301c1b5fabf653f046c82a02e7bd7a"
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
