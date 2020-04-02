FASTPASS_VERSION=0.8.3+162-d72ddd37-SNAPSHOT
BLOOP_VERSION=1.4.0-RC1-185-d13246c0
COURSIER_REPOSITORIES="https://artifactory.twitter.biz/repo1.maven.org"

coursier bootstrap --standalone org.scalameta:metals_2.12:$FASTPASS_VERSION  -r sonatype:snapshots --main scala.meta.internal.pantsbuild.BloopPants -f -o fastpass
svn import -m "Add fastpass version $FASTPASS_VERSION" fastpass https://svn.twitter.biz/science-binaries/home/pants/build-support/bin/fastpass/$FASTPASS_VERSION/fastpass

coursier bootstrap ch.epfl.scala:bloop-frontend_2.12:$BLOOP_VERSION --main-class com.martiansoftware.nailgun.NGServer -f -o  bloop-server
svn import -m "Add bloop-server version $BLOOP_VERSION" bloop-server https://svn.twitter.biz/science-binaries/home/pants/build-support/bin/bloop-server/$BLOOP_VERSION/bloop-server



