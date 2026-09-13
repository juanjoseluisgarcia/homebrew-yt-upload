class YtUpload < Formula
  desc "CLI that uploads a video to YouTube using the resumable upload protocol"
  homepage "https://github.com/juanjoseluisgarcia/yt-upload"
  url "https://github.com/juanjoseluisgarcia/yt-upload/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d562e233fcc1a26eabfad816c90d3d2416e5104262607701a4231eefde00f117"
  license "MIT"
  head "https://github.com/juanjoseluisgarcia/yt-upload.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage", shell_output("#{bin}/yt-upload --help")
  end
end
