### FaE:  
This Solidity program is a smart contract that demonstrates the basics of token creation, manipulation, and transfer using the Solidity programming language. It uses essential features such as `require`, `revert`, and `assert` for error handling, making it a comprehensive example of how to implement safe operations on the Ethereum blockchain.  

---

### **Description**  
This program is a smart contract written in Solidity, designed to create and manage a simple token named "Jolibee" with the abbreviation "Jb." The contract includes functionalities for minting, burning, and transferring tokens between addresses, while employing Solidity's `require`, `revert`, and `assert` statements to ensure secure and consistent operations.  

It is a foundational contract suitable for beginners who want to learn about token economics and error handling in Solidity.  

---

### **Key Features**  
- **Token Details**: The contract stores the token name, abbreviation, and total supply.  
- **Minting**: Allows the creation of new tokens and assigns them to specific addresses.  
- **Burning**: Destroys tokens, reducing the total supply, only if the conditions are met.  
- **Transferring**: Facilitates transferring tokens between addresses with checks for validity.  
- **Error Handling**:  
  - `require` ensures conditions like valid balances and non-zero transfers.  
  - `revert` stops execution for invalid operations, such as transfers to the zero address.  
  - `assert` validates invariants and consistency in token balances.  

---

### **Getting Started**  

#### **Executing the Program**  
To run this program, you can use Remix, an online Solidity IDE. Follow these steps:  

#### 1. Go to the Remix Website  
Visit [Remix](https://remix.ethereum.org/).  

#### 2. Create a New File  
- Click on the "+" icon in the left-hand sidebar.  
- Save the file with a `.sol` extension (e.g., `FaE.sol`).  
- Copy and paste the following code into the file:  

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FaE {

    // Public variables for token details
    string public tokenName = "Jolibee";
    string public tokenAbbrv = "Jb";
    uint public totalSupply = 0;

    // Mapping to track balances of addresses
    mapping(address => uint) public balances;

    // Mint function to create new tokens
    function mint(address _address, uint _value) public {
        // Use require to ensure a valid amount is minted
        require(_value > 0, "Mint amount must be greater than 0");
        
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Burn function to destroy tokens
    function burn(address _address, uint _value) public {
        // Require that the burn value is not greater than the balance
        require(balances[_address] >= _value, "Insufficient balance to burn");

        totalSupply -= _value;
        balances[_address] -= _value;
        
        // Use assert to check that the total supply is consistent
        assert(totalSupply >= 0);
    }

    // Function to transfer tokens from one address to another
    function transfer(address _from, address _to, uint _value) public {
        // Require that the sender has enough tokens to transfer
        require(balances[_from] >= _value, "Insufficient balance for transfer");

        // Ensure the transfer value is greater than zero
        require(_value > 0, "Transfer amount must be greater than 0");

        // Check if the recipient address is valid
        if (_to == address(0)) {
            // Revert the transaction if the recipient address is invalid
            revert("Cannot transfer to the zero address");
        }

        // Execute the transfer
        balances[_from] -= _value;
        balances[_to] += _value;

        // Use assert to verify that balances are still valid
        assert(balances[_from] + balances[_to] == totalSupply);
    }
}
```  

#### 3. Compile the Code  
- Click on the "Solidity Compiler" tab in the left-hand sidebar.  
- Ensure the "Compiler" option is set to **0.8.26** (or another compatible version).  
- Click on the "Compile FaE.sol" button.  

#### 4. Deploy the Contract  
- Go to the "Deploy & Run Transactions" tab in the left-hand sidebar.  
- Select the `FaE` contract from the dropdown menu.  
- Click on the "Deploy" button.  

#### 5. Interact with the Contract  
Once deployed, you can interact with the contract using the following functions:  
- **Minting**: Use the `mint` function to add tokens to an address.  
- **Burning**: Use the `burn` function to remove tokens from an address if the balance is sufficient.  
- **Transferring**: Use the `transfer` function to send tokens from one address to another while validating conditions.  

Test the contract by selecting the deployed `FaE` contract in the left-hand sidebar and using the available functions.  

---

### **Authors**  
**Garcia, John Vincent G.**  
202010607  
BSCSSE  
