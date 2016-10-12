contract A {
    uint counter ; 
    function increment(uint add) {
       counter = counter + add;
    }
}

contract B {
    function delegateIncrement(address aaddr, uint add) {
        A(aaddr).increment(add) ; 
    }
}
