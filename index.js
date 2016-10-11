var express = require('express');
var w3 = require('web3');

// UPDATE the three values below!
var sandboxId = '2db7c2fc4a';
var sandboxUrl = 'https://trainer01.by.ether.camp:8555/sandbox/' + sandboxId;
var contractAddress = '0x8c65ae6ccd6c72d623ea847636f78ddc77685087';
// \UPDATE

var web3 = new w3(new w3.providers.HttpProvider(sandboxUrl));

require ('./abi.js');

web3.eth.defaultAccount = web3.eth.accounts[0];
var contractObject = web3.eth.contract(contractAbi);
var contractInstance = contractObject.at(contractAddress);
console.log(JSON.stringify(contractAbi));

contractInstance.setGreeting('Hello Blockchain!', function(error, response) {
    console.log('set greeting: ' + response);
    contractInstance.getGreeting(function(error2, response2) {
        console.log('got greeting: ' + response2);
    });
});
