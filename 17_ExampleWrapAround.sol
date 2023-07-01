// SPDX-License-Identifier: MIT 
pragma solidity 0.8.14;

contract ExampleWrapAround{
    uint256 public myUint;
    uint256 public myUint8 = 2**4;
    int public myInt = -10;

    function setMyUint(uint _myUint) public{
        myUint = _myUint;
    }

    function decrementUint() public{
        myUint--;
    }

    function incrementUint8() public{
        myUint8++;
    }

    function incrementInt() public{
        myInt++;
    }
}