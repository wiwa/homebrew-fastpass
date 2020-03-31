require 'formula'

class Fastpass < Formula
  desc "Metals 36"
  homepage ""
  version "36"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v36/fastpass.tar.gz"
  sha256 "875212ff7fa38692666b3de08537e95ea2ecf5fe5a702cd175f40d4aaf6f1f43"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
