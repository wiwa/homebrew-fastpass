require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  url "https://github.com/olafurpg/homebrew-fastpass/archive/v1.0.zip"
  sha256 "bc77b18d4b780520c4c26a37051d8becbebd370de7dc42ced53256a96e42e2fa"
  depends_on 'coursier/formulas/coursier'
  def install
    system 'coursier',
      'bootstrap', 
      'org.scalameta:metals_2.12:0.7.6+707-c2394b32-SNAPSHOT',
      '-r', 'sonatype:snapshots',
      '--main', 'scala.meta.internal.pantsbuild.BloopPants',
      '-o', 'fastpass',
      '-f'
    bin.install 'fastpass'
  end
end
