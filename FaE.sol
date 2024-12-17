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
