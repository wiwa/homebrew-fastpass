require 'formula'

class Fastpass < Formula
  desc "Metals 21"
  homepage ""
  version "21"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v21/fastpass.tar.gz"
  sha256 "87dc55790478a7024af96dd3c5cb2d0a130985247d5d195b6bad564925638739"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "bin/fastpass"
  end
end
