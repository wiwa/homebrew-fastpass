set -eux
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1+33-dfd03f53}
METALS_VERSION=${METALS_VERSION:-0.8.1-SNAPSHOT}

rm bin/*

cs bootstrap --standalone \
  org.scalameta:metals_2.12:$METALS_VERSION \
  -o bin/fastpass \
  --force \
  --main-class scala.meta.internal.pantsbuild.BloopPants

cs bootstrap --standalone \
  ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION \
  -o bin/bloop \
  --force \
  --main-class bloop.bloopgun.Bloopgun
