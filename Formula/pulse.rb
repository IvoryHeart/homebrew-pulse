class Pulse < Formula
  desc "macOS health monitor - CLI + menu bar app, pure Swift, zero dependencies"
  homepage "https://github.com/IvoryHeart/pulse"
  url "https://github.com/IvoryHeart/pulse/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "839d1f16106319b70ed034dc399012986ea57ca7a296c7fe54284cf8bcd66cca"
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
