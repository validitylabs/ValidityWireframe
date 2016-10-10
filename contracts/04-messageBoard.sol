contract messageBoard {
    struct m {
        address sender;
        string text;
        uint time;
        uint val;
    }

    m[] msgs;

    function addMessage(string text) {
        msgs.push(m(msg.sender, text, now, msg.value));
    }
    
    function getNumMessages() constant returns (uint n) {
        n = msgs.length;
    }
    
    function getMessage(uint id) constant returns (address sender, string text, uint time, uint val) {
        sender = msgs[id].sender;
        text = msgs[id].text;
        time = msgs[id].time;
        val = msgs[id].val;
    }
}
