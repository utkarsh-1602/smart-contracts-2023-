// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleMsgSender{

    address public someAddress;

    function updateSomeAddress() public{
        someAddress = msg.sender; 
        // msg.sender is the address of the person who is interacting with the smart contract 

    }

}