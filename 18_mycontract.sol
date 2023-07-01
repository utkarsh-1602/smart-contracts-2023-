//SPDX-License-Identifier: MIT 
pragma solidity 0.8.14;

contract MyContract{

    string public mystring = "Hello purva";

    function updateOurString(string memory _updateString) public{
        mystring = _updateString; 
    }
}
