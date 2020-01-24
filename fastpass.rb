require 'formula'

class Fastpass < Formula
  desc "Metals 24"
  homepage ""
  version "24"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v24/fastpass.tar.gz"
  sha256 "fd77f2087bba7f2d173b9bd1a52b7dc2e562eee4175115b8a34d09c5625688cd"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
