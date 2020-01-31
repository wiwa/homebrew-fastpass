require 'formula'

class Fastpass < Formula
  desc "Metals 28"
  homepage ""
  version "28"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v28/fastpass.tar.gz"
  sha256 "e295977461d8d2441f9618da6fb6da15f0c14f2743eecc07368fc5a9b158cfcc"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
