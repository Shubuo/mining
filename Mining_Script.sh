#!/bin/sh
sudo yum update -y
sudo yum groupinstall "Development Tools"

#NVIDIA
BASE_URL=https://us.download.nvidia.com/tesla
DRIVER_VERSION=450.80.02
curl -fSsl -O $BASE_URL/$DRIVER_VERSION/NVIDIA-Linux-x86_64-$DRIVER_VERSION.run

# The .run can also be downloaded using wget or curl as shown in the example below:
#Once the .run installer has been downloaded, the NVIDIA driver can be installed:

sudo sh NVIDIA-Linux-x86_64-$DRIVER_VERSION.run

#CUDA
wget https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run
chmod +x cuda_11.3.1_465.19.01_linux.run
sudo sh cuda_11.3.1_465.19.01_linux.run --silent --override --toolkit --samples --toolkitpath=/usr/local/cuda-11 --samplespath=/usr/local/cuda
whereis cuda
sudo ln -s /usr/local/cuda-11 /usr/local/cuda

#MINING
wget https://trex-miner.com/download/t-rex-0.20.4-linux.tar.gz
mkdir t-rex 
mv t-rex-0.20.4-linux.tar.gz t-rex
cd ~/t-rex
tar -xzf t-rex-0.20.4-linux.tar.gz

screen
#US-east
./t-rex -a ethash -o stratum+tcp://us1.ethermine.org:4444 -u 0x82ecadfcec51863ffa044000e0ca8b4962b1849d -p x

#US-west
#./t-rex -a ethash -o stratum+tcp://us2.ethermine.org:4444 -u 0x82ecadfcec51863ffa044000e0ca8b4962b1849d -p x