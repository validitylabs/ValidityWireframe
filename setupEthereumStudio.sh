#!/bin/bash
# set -e

# this script is supposed to run on Ubuntu 14.04 (default for Ethereum Studio)

# remove folder with default contracts
cd
cd workspace
rm example-project -r

# update nodejs to 6.x which is required for ipfs-api
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
