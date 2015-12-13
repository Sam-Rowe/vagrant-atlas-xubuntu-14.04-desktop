#!/bin/bash

set -o errexit

apt-get install -y git
git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr/local
cd ..
