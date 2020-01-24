set -eux
rm -rf foo*
mkdir foo
cd foo
tar xvf ../fastpass.tar.gz
./bin/fastpass --help | head -n 1
./bin/bloop exit
./bin/bloop help | head -n 1
./bin/bloop help | head -n 1
