#!/bin/bash

cd ~

ADR=$(ls chainData/keystore/ | sed -e 's/.*Z--/0x/' -e '2,$d')
echo "Starting geth with default account $ADR ..."

geth --nodiscover --maxpeers 0 --datadir "./chainData" --targetgaslimit "123123123" --mine --minerthreads=1 --rpc --rpcapi "eth,net,web3,personal" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --unlock $ADR --password /dev/null console
