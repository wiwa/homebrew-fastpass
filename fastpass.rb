require 'formula'

class Fastpass < Formula
  desc "Metals 1.12"
  homepage ""
  version "1.12"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.12/fastpass"
  sha256 "512b6532aefb6cf23d1c120efa8b6641a2f1cb8018ff5c65f75292a830ee21f0"
  def install
    bin.install 'fastpass'
  end
end
