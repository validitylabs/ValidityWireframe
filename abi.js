contractAbi = [
  {
    "constant": true,
    "inputs": [],
    "name": "getNumMessages",
    "outputs": [
      {
        "name": "n",
        "type": "uint256"
      }
    ],
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "newOwner",
        "type": "address"
      }
    ],
    "name": "transferOwner",
    "outputs": [],
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "text",
        "type": "string"
      }
    ],
    "name": "addMessage",
    "outputs": [],
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "price",
        "type": "uint256"
      }
    ],
    "name": "setCostPerMessage",
    "outputs": [],
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [],
    "name": "getCostPerMessage",
    "outputs": [
      {
        "name": "i",
        "type": "uint256"
      }
    ],
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [
      {
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "getMessage",
    "outputs": [
      {
        "name": "sender",
        "type": "address"
      },
      {
        "name": "text",
        "type": "string"
      },
      {
        "name": "time",
        "type": "uint256"
      },
      {
        "name": "val",
        "type": "uint256"
      },
      {
        "name": "deleted",
        "type": "bool"
      }
    ],
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "deleteMessage",
    "outputs": [],
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [
      {
        "name": "tokenContractAddress",
        "type": "address"
      }
    ],
    "name": "setTokenContract",
    "outputs": [],
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "sender",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "text",
        "type": "string"
      },
      {
        "indexed": false,
        "name": "time",
        "type": "uint256"
      },
      {
        "indexed": false,
        "name": "val",
        "type": "uint256"
      }
    ],
    "name": "receivedMessage",
    "type": "event"
  }
];