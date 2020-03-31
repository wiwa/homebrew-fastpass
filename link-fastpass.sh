set -eux
VERSION=$1
NATIVE=$(~/.jabba/bin/jabba which --home graalvm@19.3.1)/bin/native-image
$NATIVE -cp $(cs fetch org.scalameta:metals_2.12:$VERSION -p -r sonatype:snapshots) \
  --initialize-at-build-time \
  --initialize-at-run-time=scala.meta.internal.pantsbuild,metaconfig \
  --no-server \
  --no-fallback \
  --allow-incomplete-classpath \
  --enable-https \
  -H:EnableURLProtocols=https \
  -H:+ReportUnsupportedElementsAtRuntime \
  -H:ReflectionConfigurationFiles=$(pwd)/reflection.json \
  scala.meta.internal.pantsbuild.BloopPants \
  bin/fastpass

say 'fastpass native-image ready'
