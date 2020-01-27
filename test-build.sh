set -eux
rm -rf test-fastpass*
mkdir test-fastpass
cd test-fastpass
tar xvf ../fastpass.tar.gz
./bin/fastpass --help | head -n 1
./bin/bloop exit
./bin/bloop help | head -n 1
./bin/bloop help | head -n 1
