class Pulse < Formula
  desc "macOS health monitor - CLI + menu bar app, pure Swift, zero dependencies"
  homepage "https://github.com/IvoryHeart/pulse"
  url "https://github.com/IvoryHeart/pulse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/IvoryHeart/pulse.git", branch: "main"

  depends_on :macos => :sonoma
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/pulse"
  end

  test do
    assert_match "pulse v", shell_output("#{bin}/pulse --version")
  end
end
