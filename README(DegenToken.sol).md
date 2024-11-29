DegenToken ERC20 Smart Contract
Overview
The DegenToken is an ERC20 token implemented for use in a gaming platform. It provides functionality for minting new tokens, transferring tokens between users, redeeming tokens for in-game items, checking balances, and burning tokens. The contract is designed to be used as a reward system where players can earn and use tokens within the platform.

Description
The DegenToken smart contract is an implementation of the ERC20 token standard, with extensions for minting, burning, and checking balances. It allows the platform owner to mint tokens and distribute them to players as rewards. Players can transfer tokens to one another, redeem tokens for in-game items, and burn tokens that are no longer needed. The contract also ensures that players can check their token balances at any time. This contract is deployed on the Ethereum-compatible network, such as Avalanche, and serves as a core component of the game’s economic system.

Getting Started
Installing
To begin using the DegenToken contract, you’ll need a development environment set up with the following dependencies:

Hardhat: For compiling, testing, and deploying the contract.
OpenZeppelin Contracts: A library of secure, community-vetted smart contracts, including ERC20 and Ownable contracts.
Solidity Compiler: Ensure you have the correct version of Solidity installed (0.8.x).
Steps to Install:
Clone the repository (if applicable) or copy the contract code into a new file.
Install Hardhat (if you don’t have it):
bash
Copy code
npm install --save-dev hardhat
Install OpenZeppelin Contracts:
bash
Copy code
npm install @openzeppelin/contracts
Create a Hardhat project:
bash
Copy code
npx hardhat init
Place the DegenToken contract code inside your contracts/ folder in the Hardhat project.
Compile the contract:
bash
Copy code
npx hardhat compile
Modifications to Files/Folders:
Ensure that the DegenToken contract is placed within the contracts/ directory of your project.
Modify the constructor in the contract to deploy it with your desired initial settings (such as setting the owner address).
Executing the Program
To deploy and interact with the DegenToken contract:

Deploy the contract to a network (such as Ethereum, Avalanche, etc.) by setting up a deployment script.

Example deploy script (scripts/deploy.js):

javascript
Copy code
async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const Token = await ethers.getContractFactory("DegenToken");
    const token = await Token.deploy();
    console.log("Token deployed to:", token.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
Run the deployment script:

bash
Copy code
npx hardhat run scripts/deploy.js --network <network_name>
Interacting with the contract:

You can interact with the deployed contract through Hardhat’s console or create a front-end application using a framework like React and Web3.js or Ethers.js to call the functions.
Functions:
mint(address to, uint256 amount): Only the owner can mint tokens and send them to a given address.
transferTokens(address recipient, uint256 amount): Allows players to transfer tokens to each other.
redeem(address storeAddress, uint256 amount): Allows players to redeem tokens for in-game items by transferring tokens to a store address.
checkBalance(address account): Allows players to check the token balance of any account.
burn(uint256 amount): Allows players to burn their tokens to reduce supply.
Example Commands:
Mint tokens:
javascript
Copy code
await token.mint(playerAddress, 1000);
Transfer tokens:
javascript
Copy code
await token.transferTokens(recipientAddress, 100);
Redeem tokens:
javascript
Copy code
await token.redeem(storeAddress, 50);
Help
Common Problems:
If you receive an error when trying to mint tokens, ensure that you are the owner of the contract.
Make sure the contract is properly deployed before interacting with it.
If the token balance isn't updating as expected, check that you are using the correct address for your wallet.
Helpful Commands:
To verify your contract on a network like Avalanche or Ethereum:

bash
Copy code
npx hardhat verify --network <network_name> <contract_address>
To interact with the contract on a local network:

bash
Copy code
npx hardhat console --network localhost

Code:
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/*
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/

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


Authors:
Garcia, John Vincent
202010607 - BSCSSE
FEU Tech
