// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleViewPure{

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint){
        return myStorageVariable; 
    }
    // view functions can call storage variables outside their function also


    function getAddition(uint a, uint b) public pure returns(uint){
        return a+b;
    }
    // pure functions call only call storage variables within their function 


    function setMyStorageVariable(uint _newVar) public{
        myStorageVariable = _newVar; 
    }


    
}