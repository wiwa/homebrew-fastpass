require 'formula'

class Fastpass < Formula
  desc "Metals 1.13"
  homepage ""
  version "1.13"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.13/fastpass"
  sha256 "800ff0364879dabf70ccc8645600ce975c9d1acb18aa9a0481958d535aafdda6"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
