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
