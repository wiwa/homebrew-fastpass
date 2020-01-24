require 'formula'

class Fastpass < Formula
  desc "Metals 23"
  homepage ""
  version "23"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v23/fastpass.tar.gz"
  sha256 "ef405b55f4d088f48107973bde2fd351a1a2662fedae51e6b4addea9951753d4"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
