pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
    mapping(address => uint256) public amount;
    uint256 totalAmount;
    string tokenName;
    string tokenSymbol;
    uint256 decimal;
    constructor() ERC20("Mytoken", "mtk") public{
        totalAmount = 10000 * 10 ** 18;
        amount[msg.sender] = totalAmount;
        decimal = 18;
    }
    function totalSupply() public view override returns(uint256){
        return totalAmount;
    }
    function balanceOf(address account) public view override
    returns(uint256){
        return amount[account];
    }
    function transfer(address recipient, uint256 _amount) public override returns(bool) {
        require(_amount <= amount[msg.sender]);
        amount[msg.sender] = amount[msg.sender] - _amount;
        amount[recipient] = amount[recipient] + _amount;
        return true;
    }
}