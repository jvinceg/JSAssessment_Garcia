MyToken:
This Solidity program is a simple smart contract that demonstrates the basics of token creation and manipulation using the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to understand how to create, mint, and burn tokens on the Ethereum blockchain.

Description:
This program is a smart contract written in Solidity, a language used for developing decentralized applications and smart contracts on the Ethereum blockchain. The contract creates a simple token named "Jolibee" with the abbreviation "Jb." It allows minting and burning of tokens through its functions. This contract can be a foundation for more complex projects involving token economics or decentralized applications in the future.

Key Features:
Token Details: The contract stores the token name, abbreviation, and total supply.
Minting: New tokens can be added to the total supply and assigned to specific addresses.
Burning: Tokens can be destroyed, reducing the total supply if certain conditions are met.
Balance Tracking: The balance of each address holding the token is managed and updated automatically.


Getting Started:
Executing the Program
To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

Go to the Remix website: Remix.

Create a new file:

Click on the "+" icon in the left-hand sidebar.
Save the file with a .sol extension (e.g., MyToken.sol).
Copy and paste the following code into the file:
solidity

Copy code:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    // public variables here
    string public tokenName = "Jolibee";
    string public tokenAbbrv = "Jb";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // burn function
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_address] -= _value;
    }
}

Compile the Code:
Click on the "Solidity Compiler" tab in the left-hand sidebar.
Ensure the "Compiler" option is set to 0.8.26 (or another compatible version).
Click on the "Compile MyToken.sol" button.
Deploy the Contract:

Go to the "Deploy & Run Transactions" tab in the left-hand sidebar.
Select the MyToken contract from the dropdown menu.
Click on the "Deploy" button.
Interact with the Contract:

Once deployed, you can interact with the contract:
Minting: Use the mint function to add tokens to an address.
Burning: Use the burn function to remove tokens, as long as the balance is sufficient.
In the left-hand sidebar, select the deployed MyToken contract and use the available functions to test the contract.

Authors:
Garcia, John Vincent G.
202010607
BSCSSE
