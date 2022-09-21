// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;
    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Yo, Only owner can do that!!!");
        require(amount <= balance, "Poor balance");
        destAddr.transfer(amount);
        balance -=amount;
    }
}