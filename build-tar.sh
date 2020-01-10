#!/usr/bin/env zsh
set -eux
METALS_VERSION=${METALS_VERSION:-0.7.6+724-16691b3e-SNAPSHOT}
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1}
VERSION="$1"
TAG="v$1"
NATIVE=$(~/.jabba/bin/jabba which --home graal-custom@19.3)/bin/native-image
CLASSPATH=$(cs fetch org.scalameta:metals_2.12:$METALS_VERSION -p -r sonatype:snapshots)
$NATIVE -cp $CLASSPATH --initialize-at-build-time --no-server --no-fallback --allow-incomplete-classpath -H:EnableURLProtocols=https -H:ReflectionConfigurationFiles=$(pwd)/reflection.json scala.meta.internal.pantsbuild.BloopPants bin/fastpass
# $NATIVE -cp $(cs fetch ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION -p) --initialize-at-build-time --no-server --no-fallback --allow-incomplete-classpath -H:ReflectionConfigurationFiles=$(pwd)/reflection.json bloop.bloopgun.Bloopgun bin/bloop
TAR=fastpass.tar.gz
tar -czvf $TAR bin/
hub release create -a $TAR -m "Fastpass $TAG" $TAG
FASTPASS_URL=https://github.com/olafurpg/homebrew-fastpass/releases/download/$TAG/$TAR
SHA=$(curl -L $FASTPASS_URL | shasum -a 256 | awk '{ print $1 }')

cat > fastpass.rb <<EOF
require 'formula'

class Fastpass < Formula
  desc "Metals $VERSION"
  homepage ""
  version "$VERSION"
  url "$FASTPASS_URL"
  sha256 "$SHA"
  depends_on "coursier/formulas/coursier"
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "bin/fastpass"
  end
end
EOF
git add .
git commit -am "Release $TAG"
git push origin master
brew upgrade fastpass
