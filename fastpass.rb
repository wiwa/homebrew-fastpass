require 'formula'

class Fastpass < Formula
  desc "Metals 34"
  homepage ""
  version "34"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v34/fastpass.tar.gz"
  sha256 "78b3fb3b6e68c4d06edb025d219ef94acc250e3ff39adf049ec2f4493b832d67"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
