#!/bin/bash

cd ~

echo "Setting up 16 GB swap file..."
sudo fallocate -l 16G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "Installing custom geth..."
wget https://github.com/SCBuergel/go-ethereum/releases/download/0.1/geth
chmod +x geth
mv ./geth /usr/local/bin

echo "Setting up geth files..."
mkdir chainData
echo "
{
    \"nonce\": \"0x0000000000000042\",
    \"timestamp\": \"0x0\",
    \"parentHash\": \"0x0000000000000000000000000000000000000000000000000000000000000000\",
    \"extraData\": \"0x0\",
    \"gasLimit\": \"123123123\",
    \"difficulty\": \"0x400\",
    \"mixhash\": \"0x0000000000000000000000000000000000000000000000000000000000000000\",
    \"coinbase\": \"0x3333333333333333333333333333333333333333\",
    \"alloc\": {
    }
}
" >> customGenesis.json
geth --datadir "./chainData" init customGenesis.json

echo "Creating 3 accounts..."
echo "web3.personal.newAccount('')
web3.personal.newAccount('')
web3.personal.newAccount('')" >> createAccounts.js
geth --datadir "./chainData" js createAccounts.js

echo "Installing Solidity compiler..."
sudo add-apt-repository ppa:ethereum/ethereum -y
sudo apt-get update
sudo apt-get install solc -y

echo "Installing Node.JS 7..."
curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
rm nodesource_setup.sh
sudo apt-get install nodejs -y
npm install pm2 -g
sudo apt-get install build-essential -y

ADR=$(ls chainData/keystore/ | sed -e 's/.*Z--/0x/' -e '2,$d')
echo "Starting geth with default account $ADR ..."

geth --nodiscover --maxpeers 0 --datadir "./chainData" --targetgaslimit "123123123" --mine --minerthreads=1 --rpc --rpcapi "eth,net,web3,personal" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --unlock $ADR --password /dev/null console
