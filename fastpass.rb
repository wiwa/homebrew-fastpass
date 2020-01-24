require 'formula'

class Fastpass < Formula
  desc "Metals 25"
  homepage ""
  version "25"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v25/fastpass.tar.gz"
  sha256 "d3eb56d597e4df6b5e9407bf76dab02b5de173adf0f64313897f648a73351631"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
