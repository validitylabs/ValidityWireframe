contract tokenContract {
    mapping (address => uint) balance;
    mapping (address => bool) frozen;
    address owner;

    function tokenContract(uint supply) {
        balance[msg.sender] = supply;
        owner = msg.sender;
    }
    
    function pay(uint amount, address to) {
        if (balance[msg.sender] < amount)
            throw;
        if (frozen[msg.sender])
            throw;
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
    
    modifier onlyOwner() {
        if (msg.sender != owner)
            throw;
        else
            _
    }
    
    function transferOwner(address newOwner) onlyOwner {
        owner = newOwner;
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
