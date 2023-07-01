// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

contract SampleFallback{

    uint public lastValueSent;
    string public lastFunctionCalled; 
    uint public myUint;
    // fallback function 
    // The receive function is automatically called when the contract receives Ether without any accompanying data. It is the recommended way to handle incoming Ether in newer versions of Solidity.

    function setMyUint(uint _myNewUint) public{
        myUint = _myNewUint; 
    }

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable{
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback"; 
    }
}