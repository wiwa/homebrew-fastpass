require 'formula'

class Fastpass < Formula
  desc "Metals 30"
  homepage ""
  version "30"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v30/fastpass.tar.gz"
  sha256 "5bf86b70bb04b4b0103db8a33c0d6f2a0e22e624cb335ef6549e2b018d0262ee"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
