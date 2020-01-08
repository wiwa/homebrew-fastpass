require 'formula'

class Fastpass < Formula
  desc "Metals 1.16"
  homepage ""
  version "1.16"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.16/fastpass"
  sha256 "e66f86a99a1a130307b1f50735373a322a7a04089c91dfcd2d891c72b5d04877"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
