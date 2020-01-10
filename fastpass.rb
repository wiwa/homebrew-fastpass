require 'formula'

class Fastpass < Formula
  desc "Metals 22"
  homepage ""
  version "22"
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v22/fastpass.tar.gz"
  sha256 "4ea7192f0fbd183afda3c062bf15dae7f37d97fd05ad618cb7e5d435889eb343"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
