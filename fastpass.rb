require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.10"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.10/fastpass"
  sha256 "58bfd20a479ce7fc463581cc760a75bfff32bf1d38d6a4570c1498583753fec6"
  def install
    bin.install 'fastpass'
  end
end
