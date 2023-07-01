// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ContractOne{

    mapping(address => uint) public addressBalances;

    function deposit() public payable{
        addressBalances[msg.sender] += msg.value; 
        // here msg.sender gonna be ContractTwo, because ContractTwo called the ContractOne 
    }

// it's a fallback function 
    receive() external payable{
        deposit();
    }
}

contract ContractTwo{
    receive() external payable{}

    function depositContractOne(address _contractOne) public{
        // bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value:10, gas: 100000}(""); 
        require(success);
        // ContractOne one = ContractOne(_contractOne);    
        // one.deposit{value: 10, gas: 100000}();
    }
}