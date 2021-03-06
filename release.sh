set -eux
METALS_VERSION=$1
VERSION=$2
TAG=v$2
coursier bootstrap org.scalameta:metals_2.12:$METALS_VERSION -r sonatype:snapshots --main scala.meta.internal.pantsbuild.BloopPants -o fastpass -f
hub release create -a fastpass -m "Fastpass $TAG" $TAG
FASTPASS_URL=https://github.com/olafurpg/homebrew-fastpass/releases/download/$TAG/fastpass
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
    bin.install "fastpass"
  end
end
EOF
git add .
git commit -am "Release $TAG"
git push origin master
brew upgrade fastpass
