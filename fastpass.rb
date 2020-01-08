require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.6"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.6/fastpass"
  sha256 "6c3f3915d58f69934bf82cd426489eddf113eb52bd7fddef1d2a54c08f894dd8"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
