class Docui < Formula
  desc "TUI Client for Docker"
  homepage "https://github.com/skanehira/docui"
  url "https://github.com/skanehira/docui/archive/2.0.4.tar.gz"
  sha256 "9af1a720aa7c68bea4469f1d7eea81ccb68e15a47ccfc9c83011a06d696ad30d"
  license "MIT"
  head "https://github.com/skanehira/docui.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w"
  end

  test do
    system "#{bin}/docui", "-h"

    assert_match "Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?",
      shell_output("#{bin}/docui 2>&1", 1)
  end
end