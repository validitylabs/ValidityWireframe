var express = require('express');
var w3 = require('web3');
var app = express();

// UPDATE the three values below!
var sandboxId = '8d09356509';
var sandboxUrl = 'https://trainer02.by.ether.camp:8555/sandbox/' + sandboxId;
var contractAddress = '0x8c65ae6ccd6c72d623ea847636f78ddc77685087';
// \UPDATE

var web3 = new w3(new w3.providers.HttpProvider(sandboxUrl));

require ('./abi.js');

web3.eth.defaultAccount = web3.eth.accounts[0];
var contractObject = web3.eth.contract(contractAbi);
var contractInstance = contractObject.at(contractAddress);
console.log(JSON.stringify(contractAbi));

app.get('/setGreeting', (req, res) => {
    var greeting = req.query.greeting;
    contractInstance.setGreeting(greeting, function(error, response) {
        if (error)
            throw error;
        console.log('set greeting to ' + greeting);
        contractInstance.getGreeting(function(error2, response2) {
            if (error2)
                throw error2;
            res.send('set greeting and read it back: ' + response2);
        });
    });
});

app.get('/getGreeting', (req, res) => {
    contractInstance.getGreeting((error, response) => {
        if (error)
            throw error;
        res.send('greeting: ' + response);
    });
})

app.use('/', express.static('public'));

var port = 8080;
app.listen(port, (error, response) => {
    console.log('express webserver running on port ' + port);
})
