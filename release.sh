set -eux
METALS_VERSION=$1
VERSION=$2
coursier bootstrap org.scalameta:metals_2.12:$METALS_VERSION -r sonatype:snapshots --main scala.meta.internal.pantsbuild.BloopPants -o fastpass -f
hub release create -a fastpass -m "Fastpass $VERSION" $VERSION
BINARY=$(mktemp -d)/fastpass
FASTPASS_URL=https://github.com/olafurpg/homebrew-fastpass/releases/download/$VERSION/fastpass
curl -o $BINARY $FASTPASS_URL
SHA=$(shasum $BINARY)

cat > fastpass.rb <<EOF
require 'formula'

class Fastpass < Formula
  desc ""
  homepage ""
  url "$FASTPASS_URL"
  sha256 "$SHA"
  def install
    File.delete(path_to_file) if File.exist?(path_to_file)
    bin.install 'fastpass'
  end
end
EOF
git add .
git commit -am "Release $VERSION"

