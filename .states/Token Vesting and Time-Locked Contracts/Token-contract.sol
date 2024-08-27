// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // The initial supply of tokens (e.g., 1 million tokens)
    uint256 private constant _initialSupply = 1_000_000 * (10 ** 18);

    // Constructor function to initialize the token with a name, symbol, and initial supply
    constructor() ERC20("MyToken", "MTK") Ownable(msg.sender) {
        // Mint the initial supply of tokens to the contract deployer (owner)
        _mint(msg.sender, _initialSupply);
    }

    // Function to mint new tokens (only accessible by the contract owner)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens (remove them from circulation)
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
