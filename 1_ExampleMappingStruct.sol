// SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract ExampleMappingStruct{

    // struct which is recording the transaction 
    struct Transaction{
        uint amount;
        uint timestamp; 
    }

    struct Balance{
        uint totalBalance;
        uint numDeposits; // total no. of deposits 
        uint numWithdrawals; // total no. of withdrawals 
        mapping(uint => Transaction) deposits; // tracks a transaction for each deposit
        mapping(uint => Transaction) withdrawals; // tracks a transaction for each withdrawal 
    }


    // if we want to access deposits 
    function getDepositNum(address _from, uint _numDeposit) public view returns(Transaction memory){
        return balances[_from].deposits[_numDeposit]; 
        // so here we gonna input address of the account which made deposit, and index 
        // it will return the Transaction struct, which has variables amount and timestamp 
    }

    mapping(address => Balance) public balances; 

    function depositMoney() public payable{
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp); 
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit; 
        balances[msg.sender].numDeposits++; 
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        balances[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal; 
        balances[msg.sender].numWithdrawals++; 
        _to.transfer(_amount); 
    }
}