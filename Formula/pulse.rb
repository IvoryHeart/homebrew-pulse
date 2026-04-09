class Pulse < Formula
  desc "macOS health monitor - CLI + menu bar app, pure Swift, zero dependencies"
  homepage "https://github.com/IvoryHeart/pulse"
  url "https://github.com/IvoryHeart/pulse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1b530da132aff9b3ea7af22358d59e395345721ead8e6e9b1d581cc92f8b2910"
  license "MIT"
  head "https://github.com/IvoryHeart/pulse.git", branch: "main"

  depends_on :macos => :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/pulse"
    man1.install "docs/pulse.1"
    bash_completion.install "completions/pulse.bash" => "pulse"
    zsh_completion.install "completions/pulse.zsh" => "_pulse"
    fish_completion.install "completions/pulse.fish"
  end

  test do
    assert_match "pulse v", shell_output("#{bin}/pulse --version")
  end
end
