require 'formula'

class Fastpass < Formula
  desc "Metals 33"
  homepage ""
  version "33"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v33/fastpass.tar.gz"
  sha256 "89651be4c6319631debab6b7329ee1761c75b8afa534b3b5b2369ce69bc13ba4"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
