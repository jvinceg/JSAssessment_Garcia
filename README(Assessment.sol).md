Simple Overview
The Assessment smart contract provides basic financial account management functionalities, such as deposits, withdrawals, and balance tracking. It emphasizes secure transactions through ownership verification, error handling, and event logging, making it a great learning resource for Solidity development.

Description
The Assessment contract is a Solidity-based program designed to simulate a basic financial account with controlled access for deposits and withdrawals. Only the owner (creator of the contract) can interact with the financial functionalities, ensuring secure access. The contract also introduces custom errors and logging through events, providing transparency and clarity for all operations.

Key Features:

Ownership Verification: Ensures only the owner can interact with deposit and withdrawal functions using the require statement.
Deposit Functionality: Allows the owner to deposit funds and emits a Deposit event for transparency.
Withdrawal Functionality: Enables the owner to withdraw funds with sufficient balance and emits a Withdraw event.
Error Handling: Includes custom error (InsufficientBalance) to handle insufficient balance scenarios and ensures state consistency with require, revert, and assert.
Event Logging: Tracks all deposits and withdrawals, making the contract operations transparent.
Getting Started
Installing
Clone the repository containing the Assessment contract.

Navigate to the project directory and install dependencies:


Copy code
npm install  
Open three terminals in your code editor:

Terminal 1: For running the frontend.
Terminal 2: To start a local Hardhat node:

Copy code
npx hardhat node  
Terminal 3: To deploy the contract to the local network:
bash
Copy code
npx hardhat run --network localhost scripts/deploy.js  
Launch the frontend:


Copy code
npm run dev  
The application will run at http://localhost:3000.

Executing the Program
Deployment
Compile the contract:

Copy code
npx hardhat compile  
Deploy the contract with an initial balance:
javascript
Copy code
const { ethers } = require("hardhat");  

async function main() {  
    const Assessment = await ethers.getContractFactory("Assessment");  
    const contract = await Assessment.deploy(100);  
    console.log("Contract deployed to:", contract.address);  
}  

main().catch((error) => {  
    console.error(error);  
    process.exitCode = 1;  
});  
Interaction
Get Balance: Use the getBalance function to check the contract balance.
Deposit: Call the deposit function with an amount:
solidity
Copy code
contract.deposit(50);  
Withdraw: Call the withdraw function with the desired withdrawal amount:
solidity
Copy code
contract.withdraw(30);  
Contract Details
Constructor
Initializes the contract:

Parameters:
initBalance (uint256): Initial balance for the contract.
Sets:
owner: Address deploying the contract.
balance: Specified initial balance.
getBalance
Description: Returns the current balance of the contract.
deposit
Description: Allows the owner to deposit funds.
Parameters:
_amount (uint256): Amount to be deposited.
Emits:
Deposit event.
withdraw
Description: Enables the owner to withdraw funds if sufficient balance is available.
Parameters:
_withdrawAmount (uint256): Amount to withdraw.
Custom Error:
InsufficientBalance is triggered if the balance is insufficient.
Emits:
Withdraw event.
Authors
John Vincent G. Garcia
202010607 BSCSSE
