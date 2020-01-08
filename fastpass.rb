require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "1.11"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.11/fastpass"
  sha256 "7482ea096e772ad4f8f4187323321af236ebfb3b5aab9ba10437b2d269d3e6d0"
  def install
    bin.install 'fastpass'
  end
end
