// SPDX-License-Identifier:MIT
pragma solidity 0.7.0; 

contract ExampleExceptionRequire{

    mapping(address => uint) public withdrawAvailable;

    function receiveMoney() public payable{
        withdrawAvailable[msg.sender] += msg.value; 
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        require(_amount <= withdrawAvailable[msg.sender], "Not Enough Funds, aborting!");
        withdrawAvailable[msg.sender] -= _amount; 
        _to.transfer(_amount); 
        
    }

}

// here after deployment, we will deposit some money let's say 100 wei, and it will be stored in total balance (withdrawAvailable)
// if it is less than we can withdraw from the amount we have, but if we try to withdraw more amount than we have, it should give an error
// but the contract is still executing, so to stop that, we will use exception require 