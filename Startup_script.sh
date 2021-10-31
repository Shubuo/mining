#!/bin/bash -xe
wget https://trex-miner.com/download/t-rex-0.21.2-linux.tar.gz
mkdir t-rex
mv t-rex-0.21.2-linux.tar.gz t-rex
cd t-rex
tar -xzf t-rex-0.21.2-linux.tar.gz
screen -d -m ./t-rex -a ethash -o stratum+tcp://us1.ethermine.org:4444 -u 0xc38beA48C9414c6f779f9A8EC85F83689A4F5fAF -p x
screen -d -m ls
