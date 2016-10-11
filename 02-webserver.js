var express = require('express');
var w3 = require('web3');
var express = require('express');
var app = express();

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
    if (error)
        throw error;
    console.log('set greeting: ' + response);
    contractInstance.getGreeting(function(error2, response2) {
        if (error2)
            throw error2;
        console.log('got greeting: ' + response2);
    });
});

//app.get('/', (req, res) => {
//    res.send('Hello from Express');
//})

app.get('/getGreeting', (req, res) => {
    contractInstance.getGreeting(function(error, response) {
        res.send('greeting: ' + response);
    });
})

app.use('/', express.static('public'));

var port = 8080;
app.listen(port, (error, response) => {
    console.log('express webserver running on port ' + port);
})
