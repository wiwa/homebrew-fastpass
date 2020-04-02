require 'formula'

class Fastpass < Formula
  desc "Metals 37"
  homepage ""
  version "37"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v37/fastpass.tar.gz"
  sha256 "e9127f1ad5be24f4d96c252b0e4fd7beb8597c3a740739dffaeb70ec9c59de95"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
