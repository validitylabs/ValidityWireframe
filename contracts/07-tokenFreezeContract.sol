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

contract tokenContract is ownerControlled{
    mapping (address => uint) balance;
    mapping (address => bool) frozen;

    function tokenContract(uint supply) {
        balance[msg.sender] = supply;
    }
    
    function pay(uint amount, address to) {
        if (balance[msg.sender] < amount)
            throw;
        if (frozen[msg.sender])
            throw;
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
    
    function issueTokens(uint amount, address to) onlyOwner {
        balance[to] += amount;
    }
    
    function freeze(address addr) onlyOwner {
        frozen[addr] = true;
    }
    
    function unfreeze(address addr) onlyOwner {
        frozen[addr] = false;
    }

    function getBalance(address addr) constant returns (uint b) {
        b = balance[addr];
    }
    
    function getMyBalance() constant returns (uint b) {
        b = getBalance(msg.sender);
    }
}
