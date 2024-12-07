// SPDX-License-Identifier: GPL-3.0 
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("Degen", "DGN") Ownable (0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function transferTokens(address recipient, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _transfer(msg.sender, recipient, amount);
    }

    function redeem(address storeAddress, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _transfer(msg.sender, storeAddress, amount);
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}
