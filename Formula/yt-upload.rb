class YtUpload < Formula
  desc "CLI that uploads a video to YouTube using the resumable upload protocol"
  homepage "https://github.com/juanjoseluisgarcia/yt-upload"
  url "https://github.com/juanjoseluisgarcia/yt-upload/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5a184abba6c0936897784200912fd1efabb1ee53d08790ad690cf6c20d752e28"
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
