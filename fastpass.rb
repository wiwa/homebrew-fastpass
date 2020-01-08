require 'formula'

class Fastpass < Formula
  desc "Metals 1.14"
  homepage ""
  version "1.14"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.14/fastpass"
  sha256 "138975a97a8e080ae2930e6a8b2c7a8768e065f9c1acf9e8e7fbcb974047cb96"
  depend_on "coursier/formulas/coursier"
  depend_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
