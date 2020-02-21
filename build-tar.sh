#!/usr/bin/env zsh
set -eux
METALS_VERSION=${METALS_VERSION:-0.8.0+305-60af6828-SNAPSHOT}
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1-69-693de22a}
VERSION="$1"
TAG="v$1"
# rm -rf bin
# mkdir bin
# ./link-metals.sh $METALS_VERSION
# ./link-bloop.sh $BLOOP_VERSION
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
