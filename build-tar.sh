#!/usr/bin/env zsh
set -eux
METALS_VERSION=${METALS_VERSION:-0.8.0+136-557b46b4-SNAPSHOT}
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1+33-dfd03f53}
VERSION="$1"
TAG="v$1"
NATIVE=$(~/.jabba/bin/jabba which --home graal-custom@19.3)/bin/native-image
CLASSPATH=$(cs fetch org.scalameta:metals_2.12:$METALS_VERSION -p -r sonatype:snapshots)
rm -rf bin
mkdir bin
$NATIVE -cp $CLASSPATH \
  --initialize-at-build-time \
  --no-server \
  --no-fallback \
  --allow-incomplete-classpath \
  --enable-https \
  -H:EnableURLProtocols=https \
  -H:ReflectionConfigurationFiles=$(pwd)/reflection.json \
  scala.meta.internal.pantsbuild.BloopPants \
  bin/fastpass
# $NATIVE -cp $(cs fetch ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION -p) \
#   --initialize-at-build-time \
#   --no-server \
#   --no-fallback \
#   --allow-incomplete-classpath \
#   -H:EnableURLProtocols=https \
#   -H:ReflectionConfigurationFiles=$(pwd)/reflection.json \
#   bloop.bloopgun.Bloopgun bin/bloop
cs bootstrap --standalone \
  ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION \
  -o bin/bloop \
  --force \
  --main-class bloop.bloopgun.Bloopgun
TAR=fastpass.tar.gz
file bin/fastpass
file bin/bloop
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
  depends_on "scalacenter/bloop/bloop"
  def install
    bin.install "fastpass"
  end
end
EOF
git add .
git commit -am "Release $TAG"
git push origin master
