set -eux
VERSION=$1
NATIVE=$(~/.jabba/bin/jabba which --home graalvm@20.0.0)/bin/native-image
$NATIVE -cp $(cs fetch ch.epfl.scala:bloopgun_2.12:$VERSION -p) \
  --no-server \
  --enable-http \
  --enable-https \
  --no-fallback \
  --allow-incomplete-classpath \
  -H:ReflectionConfigurationFiles=$(pwd)/reflection.json \
  -H:+ReportExceptionStackTraces \
  -J-Djava.security.properties=java.security.overrrides \
  -Djava.security.properties=java.security.overrrides \
  --initialize-at-build-time=scala.Symbol \
  --initialize-at-build-time=scala.Function1 \
  --initialize-at-build-time=scala.Function2 \
  --initialize-at-build-time=scala.runtime.StructuralCallSite \
  --initialize-at-build-time=scala.runtime.EmptyMethodCache \
  -H:EnableURLProtocols=https \
  bloop.bloopgun.Bloopgun bin/bloop
