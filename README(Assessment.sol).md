Simple Overview:

The Assessment smart contract provides functionalities to manage financial transactions and a store of redeemable items. It allows deposits, withdrawals, item management, and item redemption with a focus on secure and transparent interactions.

Videos/Links related to the project:

    Explains why the frontend portion of the project won't work (for me in particular) and still shows how the frontend should have worked if it did: 
        https://www.loom.com/share/b975d3d325b64d1c827dd0befd9c05fc?sid=d66e52d4-052d-4503-89ec-ecf842c7a109
        
    Actual demonstration from a Remix virtual machine:
        

Description:

The Assessment contract is a Solidity-based smart contract designed to manage a financial account and an inventory of items. Only the contract owner can perform deposits, withdrawals, and item additions, ensuring controlled access. Users can redeem items if their balance covers the item's cost. The contract also incorporates custom errors and events to improve usability and traceability.

Key Features:

    Ownership Verification: Ensures only the owner can add items or manage finances.
    Deposit Functionality: Allows the owner to deposit funds, updating the balance and logging transactions via events.
    Withdrawal Functionality: Enables the owner to withdraw funds if sufficient balance is available.
    Item Management: Lets the owner add new items to the store.
    Redemption: Allows users to redeem items if their balance meets the item's price.
    Error Handling: Custom error InsufficientBalance and require statements ensure secure interactions.
    Event Logging: Tracks deposits, withdrawals, and item redemptions.

Getting Started:
    
    1.) Installing:
        Clone the repository containing the Assessment contract.
        
    2.) Navigate to the project directory and install dependencies:
        Copy code: npm install  
    
    3.) Open three terminals in your code editor:
        Terminal 1: For running the frontend.
        Terminal 2:
            To start a local Hardhat node:
            Copy code: npx hardhat node  
        Terminal 3: 
            To deploy the contract to the local network
            Copy code: npx hardhat run --network localhost scripts/deploy.js  
    
    4.) Launch the frontend:
        Copy code: npm run dev  
        The application will run at http://localhost:3000.

Executing the Program:
    
    1.) Compile the contract:
        Copy code:
        npx hardhat compile  
    
    2.) Deploy the contract with an initial balance
    
    Copy code:
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
    
Interaction:

    Get Balance: 
        Copy code:
        contract.balance();
    
    Deposit: Call the deposit function with an amount
        Copy code:
        contract.deposit(50);  
    
    Withdraw: Call the withdraw function with the desired withdrawal amount
        Copy code:
        contract.withdraw(30); 

    Add Item: Add a new item to the store
        Copy code:
        contract.addItem("Helmet", 40);  

    Redeem Item: 
        Copycode:
        contract.redeem(1);  

    Get Item Details: 
        Copy code:
        contract.items(0);

    Get the total summation of items: 
        Copy code:
        contract.itemCount();

    Get the address of the owner:
        Copy code:
        contract,owner();


Constructors: Initializes the contract

    Parameters:
        initBalance (uint256): Initial balance for the contract.
    Sets:
        owner: Address deploying the contract.
        balance: Specified initial balance.
        Adds default items ("Sword," "Shield," "Potion").
    
    deposit: Allows the owner to deposit funds.
        Parameters:
            _amount (uint256): Amount to be deposited.
        Emits: Deposit event.
    
    withdraw: Enables the owner to withdraw funds if sufficient balance is available.
        Parameters:
            _withdrawAmount (uint256): Amount to withdraw.
        Custom Error:
            InsufficientBalance is triggered if the balance is insufficient.
        Emits: Withdraw event.

    addItem: Allows the owner to add a new item to the store.
        Parameters:
            _name (string): Name of the item.
            _price (uint256): Price of the item.
        
    redeem: Allows a user to redeem an item if their balance covers its price.
        Parameters:
            itemId (uint256): ID of the item to redeem.
        Custom Error:
            InsufficientBalance is triggered if the balance is insufficient.
        Emits: Redeem event.
        
Code/s:

    // SPDX-License-Identifier: UNLICENSED
    pragma solidity 0.8.26;
    
    import "hardhat/console.sol";
    
    contract Assessment {
        address payable public owner;
        uint256 public balance;
    
        struct Item {
            string name;
            uint256 price;
        }
    
        mapping(uint256 => Item) public items;
        uint256 public itemCount;
    
        event Deposit(uint256 amount);
        event Withdraw(uint256 amount);
        event Redeem(address indexed redeemer, string itemName, uint256 itemPrice);
    
        constructor(uint256 initBalance) payable {
            owner = payable(msg.sender);
            balance = initBalance;
    
            // Initialize some items in the store
            addItem("Sword", 50);
            addItem("Shield", 30);
            addItem("Potion", 10);
        }
    
        function deposit(uint256 _amount) public payable {
            uint256 _previousBalance = balance;
    
            require(msg.sender == owner, "You are not the owner of this account");
    
            balance += _amount;
    
            assert(balance == _previousBalance + _amount);
    
            emit Deposit(_amount);
        }
    
        error InsufficientBalance(uint256 balance, uint256 withdrawAmount);
    
        function withdraw(uint256 _withdrawAmount) public {
            require(msg.sender == owner, "You are not the owner of this account");
            uint256 _previousBalance = balance;
            if (balance < _withdrawAmount) {
                revert InsufficientBalance({
                    balance: balance,
                    withdrawAmount: _withdrawAmount
                });
            }
    
            balance -= _withdrawAmount;
    
            assert(balance == (_previousBalance - _withdrawAmount));
    
            emit Withdraw(_withdrawAmount);
        }
    
        function addItem(string memory _name, uint256 _price) public {
            require(msg.sender == owner, "Only the owner can add items");
            items[itemCount] = Item(_name, _price);
            itemCount++;
        }
    
        function redeem(uint256 itemId) public {
            require(itemId < itemCount, "Item does not exist");
            Item memory item = items[itemId];
    
            if (balance < item.price) {
                revert InsufficientBalance({
                    balance: balance,
                    withdrawAmount: item.price
                });
            }
    
            balance -= item.price;
    
            emit Redeem(msg.sender, item.name, item.price);
        }
    }
    
Authors:
    
    John Vincent G. Garcia
    202010607 BSCSSE
