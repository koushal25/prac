// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
contract BankAccount {
    address public owner;
    uint public balance;
    constructor() {
        owner = msg.sender;
        balance = 0;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balance += msg.value;
    }
    function withdraw(uint amount) public onlyOwner {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(owner).transfer(amount);
    }
}