contract ownerControlled {

    address owner;

    modifier onlyOwner() {
        if (msg.sender != owner)
            throw;
        else
            _
    }
    
    function ownerControlled() {
        owner = msg.sender;
    }
    
    function transferOwner(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract tokenContract {
    mapping (address => uint) balance;

    function tokenContract(uint supply) {
        balance[msg.sender] = supply;
    }

    function pay(uint amount, address to) {
        // todo: tx.origin should be avoided for future Ethereum releases
        //       also bad practice as it does not allow for token-holding 
        //       contracts to send messages to the board
        if (balance[tx.origin] < amount)
            throw;
        balance[tx.origin] -= amount;
        balance[to] += amount;
    }
    
    function getBalance(address addr) constant returns (uint b) {
        b = balance[addr];
    }
}

contract messageBoard is ownerControlled {

    tokenContract myTokenContract;
    
    uint pricePerMessage;

    event receivedMessage(address sender, string text, uint time, uint val);
    
    struct m {
        address sender;
        string text;
        uint time;
        uint val;
        bool deleted;
    }

    m[] msgs;

    function setTokenContract(address tokenContractAddress) onlyOwner {
        // only allow tokenContract to be set once (ensures limited supply)
        if (address(myTokenContract) != 0)
            throw;

        myTokenContract = tokenContract(tokenContractAddress);
    }

    function setCostPerMessage(uint price) onlyOwner {
        pricePerMessage = price;
    }
    
    function getCostPerMessage() constant returns (uint i) {
        i = pricePerMessage;
    }

    function addMessage(string text) {
        myTokenContract.pay(pricePerMessage, this);
        msgs.push(m(msg.sender, text, now, msg.value, false));
        receivedMessage(msg.sender, text, now, msg.value);
    }
    
    function getNumMessages() constant returns (uint n) {
        n = msgs.length;
    }
    
    function deleteMessage(uint id) {
        // only sender of message can delete it
        if (msgs[id].sender != msg.sender)
            throw;
        msgs[id].deleted = true;
    }
    
    function getMessage(uint id) constant returns (address sender, string text, uint time, uint val, bool deleted) {
        sender = msgs[id].sender;
        text = msgs[id].text;
        time = msgs[id].time;
        val = msgs[id].val;
        deleted = msgs[id].deleted;
    }
}
