contract test {
    address owner;
    uint counter;
    uint totalPayIn;
    
    function test() {
        // constructor
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if (msg.sender != owner)
            throw;
        else
            _
    }
    
    function () {
        // fallback function that is called when no other function header matches
        counter++;
    }
    
    function getCounter1() constant returns (uint c) {
        return counter;
    }

    function getCounter2() constant returns (uint c, uint d) {
        c = counter;
        d = 2 * c;
    }
    
    function withdraw() onlyOwner returns (bool b){
        // allows the owner of the contract to withdraw all balance
        return owner.send(this.balance);
    }
    
    function payIn() {
        // tracks balance paid in via this function only!
        totalPayIn += msg.value;
    }
    
    function transferOwner(address newOwner) onlyOwner {
        owner = newOwner;
    }
    
    function kill() onlyOwner {
        suicide(owner);
    }
}
