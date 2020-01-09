require 'formula'

class Fastpass < Formula
  desc "Metals 20"
  homepage ""
  version "20"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v20/fastpass.tar.gz"
  sha256 "c836764a03ce406bb4119d4e6ce234b93771c3d44ca352c5602b7f7c2b80305d"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "bin/fastpass"
  end
end
