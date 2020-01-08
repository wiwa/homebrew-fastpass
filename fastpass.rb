require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.7"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.7/fastpass"
  sha256 "e1a81fa69dc9e1284a98b7b85c54c7dad28d4bd1cbb725095a3fe44289f90714"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
