// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;
 
  import "@openzeppelin/contracts/token/ERC20.sol";
  import "openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";


    contract GovernanceToken is ERC20,ERC20Votes, Ownable { 
        uint256 public constant MAX_SUPPLY =1000000 * 10 ** 18; 

//Mint entire supply to owner
    constructor  () ERC20 ("GovernanceToken", "GVT") ERCPermit ("GovernanceToken") {
        _mint(msg.sender,MAX_SUPPLY);
    }

    //override necessary functions for ERC20Votes extension compability
      function _afterTokenTransfer (address from, address to,uint256 amount)  internal override (ERC20, ERC20Votes){
        super._afterTokenTransfer(from, to, amount);    
     } 
     function _burn(address account, uint256 amount) internal override (ERC20, ERC20Votes) 
        super._mint(to, amount);
           function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._burn(account, amount);
           
    }
    }