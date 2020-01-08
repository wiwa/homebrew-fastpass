require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  url "https://github.com/olafurpg/homebrew-fastpass/releases/download/v1.4/fastpass"
  sha256 "862ef581c2df3bcd1075c80c1fd0a7880861dd5a  /var/folders/y5/gbz6gd297z57_5bg0nm589nr0000gp/T/tmp.I5o03FyK/fastpass"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
