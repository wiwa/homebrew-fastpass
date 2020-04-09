require 'formula'

class Fastpass < Formula
  desc "Metals 39"
  homepage ""
  version "39"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v39/fastpass.tar.gz"
  sha256 "35ca4ae101fdfd88386154d09a711326a96505e3de1ba0b6e8637ccc69599200"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
