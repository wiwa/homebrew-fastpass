require 'formula'

class Fastpass < Formula
  desc "Metals 29"
  homepage ""
  version "29"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v29/fastpass.tar.gz"
  sha256 "88045b86c1103dbb94dd2b1db153ca357fd478dff4618db5f1d94110186e42f6"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
