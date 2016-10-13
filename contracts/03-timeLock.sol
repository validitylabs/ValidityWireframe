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
        payOut();   // payout will throw if funds are not ready for pay out
        account[msg.sender].balance = msg.value;
        account[msg.sender].releaseTime = now + lockTimeS;
    }
    
    function payOut() noValue returns (bool success) {
        // check if user has funds due for pay out because lock time is over
        if (account[msg.sender].balance != 0 && account[msg.sender].releaseTime > now)
            throw;
        success = msg.sender.send(account[msg.sender].balance);
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
