pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
contract AirlineTokens is ERC1155 {
  address public governance;
  uint256 public airlineCount;  
  uint256 totalAmount;
  mapping(address => uint256) public amount;
  modifier onlyGovernance() {
      require(msg.sender == governance, "only governance can call this");      
      _;
  }
  constructor(address governance_) public ERC1155("") {
      governance = governance_;
      airlineCount = 0;
      totalAmount = 10000 * 10 ** 18;
      amount[msg.sender] = totalAmount;
  }
  
  function balanceOf(address account) public view
    returns(uint256) {
        return amount[account];
    }
    
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts
    )
        public
        virtual
    {
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
        require(to != address(0), "ERC1155: transfer to the zero address");
        
    }
  function addNewAirline(uint256 initialSupply) external onlyGovernance {
      airlineCount++;
      uint256 airlineTokenClassId = airlineCount;
      _mint(msg.sender, airlineTokenClassId, initialSupply, "");
  }
 

}