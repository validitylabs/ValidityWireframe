contract b {
    int ib;

    function setib (int i) public {
        ib = i;
    }

    function getib() constant returns (int i) {
        i = ib;
    }
}


contract a {
    string sa;
    
    b myb;

    function setb (address addr) {
        myb = b(addr);
    }
    
    function setsa (string s, int i) {
        myb.setib(i);
        sa = s;
    }

    function getsa() constant returns (string s) {
        s = sa;
    }
}