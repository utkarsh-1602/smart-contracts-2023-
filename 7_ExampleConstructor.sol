// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleConstructor{

    address public myAddress;

    // constructor is directly called during the deployment of the smart contract
    // it can be called only once 

    constructor(address _someAddress){
        myAddress = _someAddress; 
    }

    function setMyAddress(address _myAddress) public{
        myAddress = _myAddress; 
    }

    function setMyAddressToSender() public{
        myAddress = msg.sender; 
    }

}