require 'formula'

class Fastpass < Formula
  desc "Metals 38"
  homepage ""
  version "38"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v38/fastpass.tar.gz"
  sha256 "3766365e83684fb81c8b2773b116ba24145eab73dbfada69a01b0a3850cd8cf6"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
