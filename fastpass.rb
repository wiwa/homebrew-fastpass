require 'formula'

class Fastpass < Formula
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
