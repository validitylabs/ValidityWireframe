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