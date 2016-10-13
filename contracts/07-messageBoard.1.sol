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

contract messageBoard is ownerControlled {

    struct m {
        address sender;
        string text;
        uint time;
        bool deleted;
    }

    m[] msgs;
    
    function addMessage(string text) {
        msgs.push(m(msg.sender, text, now, false));
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
    
    function getMessage(uint id) constant returns (address sender, string text, uint time, bool deleted) {
        sender = msgs[id].sender;
        text = msgs[id].text;
        time = msgs[id].time;
        deleted = msgs[id].deleted;
    }
}
