#!/usr/bin/env zsh
set -eux
VERSION="$1"
TAG="v$1"
METALS_VERSION=$2
BLOOP_VERSION=$3
# rm -rf bin
# mkdir bin
# ./link-fastpass.sh $METALS_VERSION
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
