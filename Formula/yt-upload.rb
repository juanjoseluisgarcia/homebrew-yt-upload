class YtUpload < Formula
  desc "CLI that uploads a video to YouTube using the resumable upload protocol"
  homepage "https://github.com/juanjoseluisgarcia/yt-upload"
  url "https://github.com/juanjoseluisgarcia/yt-upload/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "fc6ee1d65a251fe7c255ab0c8acf0fd6522366cecb5e602461823be6c284a60f"
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
