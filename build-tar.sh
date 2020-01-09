#!/usr/bin/env zsh
set -eux
METALS_VERSION=${METALS_VERSION:-0.7.7-SNAPSHOT}
BLOOP_VERSION=${BLOOP_VERSION:-1.4.0-RC1}
TAG=$1
NATIVE=$(~/.jabba/bin/jabba which --home graal-custom@19.3)/bin/native-image
$NATIVE -cp $(cs fetch org.scalameta:metals_2.12:$METALS_VERSION -p) --initialize-at-build-time --no-server --no-fallback --allow-incomplete-classpath -H:ReflectionConfigurationFiles=$(pwd)/reflection.json scala.meta.internal.pantsbuild.BloopPants bin/fastpass
$NATIVE -cp $(cs fetch ch.epfl.scala:bloopgun_2.12:$BLOOP_VERSION -p) --initialize-at-build-time --no-server --no-fallback --allow-incomplete-classpath -H:ReflectionConfigurationFiles=$(pwd)/reflection.json bloop.bloopgun.Bloopgun bin/bloop
tar -czvf fastpass.tar.gz bin/
hub release create -a fastpass.tar.gz -m "Fastpass $TAG" $TAG
