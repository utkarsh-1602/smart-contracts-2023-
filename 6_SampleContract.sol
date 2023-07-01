// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

// so if we want a smart contract to execute some function only if you are ready to pay the amount that is given


contract SampleContract{

    string public myString = "Hello world";

//  here the function will only update the string if it pays the amount 1 ether to the smart contract, for that we will use msg.value
// msg.value is the amount of ether sent with the message to the smart contract 

    function updateString(string memory _newString) public payable{
        if(msg.value == 1 ether){
            myString = _newString; 
        }
        else{
            // the transfer function will transfer the value from the smart contract to the address 
            payable(msg.sender).transfer(msg.value); 
            // here if we sent more than 1 ether to smart contract, lets say 5 ether. then i will return the 4 back the the message.sender 
        }
    }

}