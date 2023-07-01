// SPDX-License-Identifier:MIT 
pragma solidity 0.8.15;

contract ExampleMappingWithdrawls{

    function sendMoney() public payable{

    }

    function getBalance() public view returns(uint){    
        return address(this).balance; //this returns smart contract's address balance 
    }

    function withdrawAllMoney(address payable _to) public{ // address payable _to means, the address you want to pay the account 
        _to.transfer(getBalance()); 
    }
    // withdrawing the money means... you are taking your money from the smart contract 
}