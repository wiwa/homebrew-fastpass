require 'formula'

class Fastpass < Formula
  desc "Metals 1.17"
  homepage ""
  version "1.17"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.17/fastpass"
  sha256 "21492671c8f14a1f7e9c0fe4fbe50e5d7c1d8f455fde5f0025a923eea0cad9f7"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
