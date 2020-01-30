set -eux
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1+33-dfd03f53}

cs bootstrap --standalone \
  ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION \
  -o bin/bloop \
  --force \
  --main-class bloop.bloopgun.Bloopgun
