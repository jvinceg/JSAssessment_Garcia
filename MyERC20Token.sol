// SPDX-License-Identifier: MIT 
pragma solidity 0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 { address public owner; uint256 public totalSupply_;

constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
    owner = msg.sender;
    totalSupply_ = initialSupply;
    _mint(msg.sender, initialSupply);
}

function mint(address account, uint256 amount) external {
    require(msg.sender == owner, "Only the owner can mint tokens");
    _mint(account, amount);
    totalSupply_ += amount;
}

function burn(uint256 amount) external {
    _burn(msg.sender, amount);
    totalSupply_ -= amount;
}

function transfer(address recipient, uint256 amount) public override returns (bool) {
    return super.transfer(recipient, amount);
}
