pragma solidity ^0.8.0;

contract Bank{
    int bal;
    
    constructor() public {
        bal = 0;
    }
    
    function getbalance() view public returns(int){
        return bal;
    }
    function deposit(int amt) public {
        bal = bal +amt;
    }
    function withdraw(int amt)  public {
        bal = bal - amt;
    }
    
}