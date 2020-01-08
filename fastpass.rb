require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.5/fastpass"
  sha256 "66f723fa1fd0f8b306c583b8178f2810c53a1a8a1ec0079a369a9963db3fb0f6"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
