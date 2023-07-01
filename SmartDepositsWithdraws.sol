// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

contract SmartDepositsWithdraws {

    // What we have to do 
    // 1. We should be able to sent ethers from Account to smart contract (Deposit)
    // 2. We should be able to check the balance 
    // 3. We should be able to withdraw
    // 4. we should be able to withdraw from a specific address 

    uint public balanceReceived; 

    // Deposit 
    function deposit() public payable{
        balanceReceived += msg.value; 
    }   

    // check balance 
    function getContractBalance() public view returns(uint){
        return address(this).balance; 
        // address(this) is the address of the smart contract and .balance is returning the balance of it 
    }

    // withdraw all money 
    function withdrawAll() public{
        address payable to = payable(msg.sender); // msg.sender is the address of account deploying/interacting with the smart contract 
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public{
        to.transfer(getContractBalance()); 
    }

}