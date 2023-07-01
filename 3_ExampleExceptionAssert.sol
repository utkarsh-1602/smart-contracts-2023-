// SPDX-License-Identifier:MIT
pragma solidity 0.7.0; 

contract ExampleAssert{
        
    mapping(address => uint8) public withdrawAvailable;

    function receiveMoney() public payable{
        assert(msg.value == uint8(msg.value)); 
        withdrawAvailable[msg.sender] += uint8(msg.value); 
    }

    function withdrawMoney(address payable _to, uint8 _amount) public{
        require(_amount <= withdrawAvailable[msg.sender], "Not Enough Funds, aborting!");
        withdrawAvailable[msg.sender] -= _amount; 
        _to.transfer(_amount); 
        
    }
}