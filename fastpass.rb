require 'formula'

class Fastpass < Formula
  desc "Metals 27"
  homepage ""
  version "27"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v27/fastpass.tar.gz"
  sha256 "6e8ffaf8ffad6ba198dd8577f6aa89f3034e9ba228da207b86fec1b7e804e6aa"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
