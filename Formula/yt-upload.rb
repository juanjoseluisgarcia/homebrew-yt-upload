class YtUpload < Formula
  desc "CLI that uploads a video to YouTube using the resumable upload protocol"
  homepage "https://github.com/juanjoseluisgarcia/yt-upload"
  url "https://github.com/juanjoseluisgarcia/yt-upload/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "52e2460d2519ba0badf1a45bdab46de7213b5258aebe166a8294f268006eae85"
  license "MIT"
  head "https://github.com/juanjoseluisgarcia/yt-upload.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "yt-upload"
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match "Usage", shell_output("#{bin}/yt-upload --help")
  end
end
