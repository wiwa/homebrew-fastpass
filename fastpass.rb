require 'formula'

class Fastpass < Formula
  desc "Metals 1.15"
  homepage ""
  version "1.15"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.15/fastpass"
  sha256 "f06f0fdb8bccb2fdd096c51dcd993e42b8be6ae5effcbedc5b3d6a94e8f0cd13"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
