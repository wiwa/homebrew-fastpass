require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.9"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.9/fastpass"
  sha256 "81c081d04e36e485b2fe1b71b9d27122382fd16f32b2959d5cb78313d1e38ea1"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
