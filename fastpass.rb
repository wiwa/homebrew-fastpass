require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.8"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.8/fastpass"
  sha256 "644fb0168695f538ae6afb733017c16023b178c3d5beb3e8a7dff122e9dc4d27"
  def install
    old_path = '/usr/local/bin/fastpass'
    File.delete(old_path) if File.exist?(old_path)
    bin.install 'fastpass'
  end
end
