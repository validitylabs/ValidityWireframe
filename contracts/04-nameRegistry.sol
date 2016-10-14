contract nameRegistry {
    mapping (address => string) addrReg;
    mapping (string => address) nameReg;
    
    function register(string name) {
        
        // each name and address can only be registered once
        if(nameReg[name] != 0 || bytes(addrReg[msg.sender]).length != 0)
            throw;
        
        // registered names need to be minimally 3 characters long
        if(bytes(name).length < 3)
            throw;
            
        nameReg[name] = msg.sender;
        addrReg[msg.sender] = name;
    }
    
    function unregister() {
        delete nameReg[addrReg[msg.sender]];
        delete addrReg[msg.sender];
    }
    
    function getName(address a) constant returns (string name) {
        return addrReg[a];
    }
    
    function getAddress(string s) constant returns (address a) {
        return nameReg[s];
    }
}
