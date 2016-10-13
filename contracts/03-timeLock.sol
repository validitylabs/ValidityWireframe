contract timeLock {
// send some amount (in Wei) when calling the payIn function
// the amount will then be placed in a locked account
// the funds will be released once the indicated lock time in seconds
// passed and can only be retrieved by the same account which was
// depositing them - highlighting the intrinsic security model
// offered by a blockchain system like Ethereum
    
    // custom data structure to hold locked funds and time
    struct accountData {
        uint balance;
        uint releaseTime;
    }

    // only one locked account per address
    mapping (address => accountData) account;
    
    modifier noValue() {
        if (msg.value != 0)
            throw;
        else
            _
    }
    
    function () noValue {
        // prevents contract to randomly get money that belongs to no one
    }

    function payIn(uint lockTimeS) {
        if (account[msg.sender].balance != 0)
            throw;  // we can only lock one value per account

        account[msg.sender].balance = msg.value;
        account[msg.sender].releaseTime = now + lockTimeS;
    }
    
    function payOut() noValue returns (bool success) {
        
        // is there anything to send at all?
        if (account[msg.sender].balance == 0)
            throw;
            
        // are funds due yet?
        if (account[msg.sender].balance != 0 && account[msg.sender].releaseTime > now)
            throw;
        
        // send funds back
        success = msg.sender.send(account[msg.sender].balance);
        if (success)
            delete account[msg.sender];
    }
    
    // some helper functions for demo purposes (not required)
    function getMyLockedFunds() constant returns (uint v) {
        v = account[msg.sender].balance;
    }
    
    function getMyLockedFundsReleaseTime() constant returns (uint t) {
        t = account[msg.sender].releaseTime;
    }
    
    function getNow() constant returns (uint n) {
        n = now;
    }
}
