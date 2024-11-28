Assessment
The Assessment Solidity program is a smart contract designed to manage a simple account with deposit and withdrawal functionalities. It incorporates error-handling mechanisms such as require, assert, and revert to ensure secure and efficient transactions. Additionally, it uses custom errors and events to improve transparency and clarity for users interacting with the contract.

Description
This program is a smart contract written in Solidity, developed to simulate a basic financial account. The contract enables deposits and withdrawals, restricts access to the owner, and tracks the balance. It is well-suited for understanding Solidity concepts like ownership, error handling, and state management.

The contract includes:

Ownership verification using require.
Custom error (InsufficientBalance) to handle insufficient balance scenarios.
Events (Deposit and Withdraw) to log all deposit and withdrawal transactions.
Assertions to verify transaction correctness.
Key Features
Owner Access Control:

Only the owner (creator of the contract) can perform deposits and withdrawals.
Ownership is verified using the require statement.
Deposit Functionality:

Allows the owner to deposit funds, updating the balance accordingly.
Emits a Deposit event upon successful completion.
Withdrawal Functionality:

Enables the owner to withdraw funds, provided there is a sufficient balance.
Uses a custom error (InsufficientBalance) with detailed information to handle insufficient balance scenarios.
Emits a Withdraw event upon successful completion.
Error Handling:

require ensures only the owner can interact with deposit and withdrawal functions.
revert stops the withdrawal process if the balance is insufficient.
assert checks and validates state changes after transactions.
Event Logging:

Logs all deposit and withdrawal operations for transparency.
Getting Started
Executing the Program
To run this program, you can use a Solidity development environment like Hardhat.

1. Set Up the Environment
After cloning the github, you will want to do the following to get the code running on your computer.

Inside the project directory, in the terminal type: npm i
Open two additional terminals in your VS code
In the second terminal type: npx hardhat node
In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
Back in the first terminal, type npm run dev to launch the front-end.
After this, the project will be running on your localhost. Typically at http://localhost:3000/

Create a new Hardhat project.
2. Create the Solidity File
Save the contract code in a file named Assessment.sol.
3. Deploy the Contract
Deploy the contract using Hardhat's deploy script. Make sure to initialize it with an initial balance.
4. Interact with the Contract
Use Hardhat's console or a script to call the contract's functions:
Get Balance: Use the getBalance function to retrieve the current balance.
Deposit: Call the deposit function, passing the deposit amount.
Withdraw: Call the withdraw function with the desired withdrawal amount.
Contract Details
Constructor
Initializes the contract:

Parameters:
initBalance (uint256): Initial balance for the contract.
Sets:
owner to the address deploying the contract.
balance to the specified initBalance.
getBalance
Returns the current balance of the contract.

deposit
Allows the owner to deposit funds into the contract.

Parameters:
_amount (uint256): Amount to be deposited.
Emits:
Deposit event.
withdraw
Allows the owner to withdraw funds from the contract.

Parameters:
_withdrawAmount (uint256): Amount to be withdrawn.
Custom Error:
InsufficientBalance is triggered if the requested withdrawal amount exceeds the current balance.
Emits:
Withdraw event.
Authors
John Vincent G. Garcia
202010607
BSCSSE
