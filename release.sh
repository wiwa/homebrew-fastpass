set -eux
METALS_VERSION=$1
VERSION=$2
TAG=v$2
coursier bootstrap org.scalameta:metals_2.12:$METALS_VERSION -r sonatype:snapshots --main scala.meta.internal.pantsbuild.BloopPants -o fastpass -f
hub release create -a fastpass -m "Fastpass $TAG" $TAG
BINARY=$(mktemp -d)/fastpass
FASTPASS_URL=https://github.com/olafurpg/homebrew-fastpass/releases/download/$TAG/fastpass
curl -o $BINARY $FASTPASS_URL
SHA=$(shasum -a 256 $BINARY | awk '{ print $1 }')

cat > fastpass.rb <<EOF
require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  version "$VERSION"
  url "$FASTPASS_URL"
  sha256 "$SHA"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
EOF
git add .
git commit -am "Release $TAG"
brew upgrade fastpass
