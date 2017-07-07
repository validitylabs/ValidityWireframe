pragma solidity ^0.4.12;

/*
   example showing basic features of Solidity
   - type int
   - type address
   - arrays
   - constructor
   - msg.sender
   - modifiers
   - fallback function
   - constant
   - return values
   - returning multiple values
   - payable modifier
*/

contract BasicBuildingBlocks {
    address owner;
    uint counter;
    uint totalPayIn;
    int[] intArray;
    
    function test() {
        // constructor
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender != owner);
        _;
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
    
    function payIn() payable {
        // tracks balance paid in via this function only!
        totalPayIn += msg.value;
    }
    
    function transferOwner(address newOwner) onlyOwner {
        owner = newOwner;
    }
    
    function kill() onlyOwner {
        selfdestruct(owner);
    }
    
    function addToArray(int i) {
        intArray.push(i);
    }

    function getFromArray(uint index) constant returns (int i) {
        i = intArray[index];
    }
}
