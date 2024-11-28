MyERC20Token
This Solidity program is a smart contract for creating an ERC20 token with additional functionality, including minting, burning, and transferring tokens. The purpose of this contract is to provide a basic template for an ERC20 token that allows the owner to mint new tokens, and all users to burn and transfer tokens. This contract is based on OpenZeppelin’s ERC20 implementation for token standards and includes access control for minting operations.

Description:
This contract implements a custom ERC20 token with the following functionality:

The contract owner is the only one who can mint new tokens.
Any user can burn tokens from their own balance.
Any user can transfer tokens to other addresses.
The contract uses OpenZeppelin's ERC20 implementation to ensure that all the basic ERC20 token functionality (such as transferring, balance tracking, etc.) is in place. The contract also includes an access control mechanism that restricts the minting of new tokens to the owner of the contract.

Key Features:
Owner-controlled Minting: Only the contract owner can mint new tokens.
User-controlled Burning: Any user can burn their own tokens to decrease the total supply.
ERC20 Transfer: All users can transfer tokens to other addresses, following the ERC20 standard.
Total Supply Management: The total supply of tokens is updated correctly when tokens are minted or burned.
Getting Started:
Executing the Program
To run this program, you can use Remix or Hardhat as your development environment.

Using Remix:
Go to the Remix IDE.
Create a new file with the .sol extension (e.g., MyERC20Token.sol).
Copy and paste the following code into the file:
solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    address public owner;
    uint256 public totalSupply_;

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
}
Click on the "Solidity Compiler" tab and compile the contract.

Go to the "Deploy & Run Transactions" tab, select the MyERC20Token contract, and click "Deploy."

Using Hardhat:
Create a new Hardhat project by following the official Hardhat documentation.
Create a new file in the contracts folder (e.g., MyERC20Token.sol) and paste the contract code into this file.
Run npx hardhat compile to compile the contract.
Write a deployment script and deploy the contract using npx hardhat run scripts/deploy.js.
Interacting with the Contract:
Once the contract is deployed, you can interact with it in the following ways:

Minting Tokens: Only the contract owner can mint tokens by calling the mint function, specifying the address and amount of tokens to mint.
Burning Tokens: Any user can burn their own tokens by calling the burn function, which will reduce both their balance and the total supply of the token.
Transferring Tokens: Any user can transfer tokens to another address using the standard ERC20 transfer function.

Authors:
John Vincent Garcia
202010607 - BSCSSE
FEU Tech
