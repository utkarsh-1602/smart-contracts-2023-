// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

contract Wallet{
    PaymentReceived public payment; // here payment is a state variable of type PaymentReceived 

    function payContract() public payable{
        payment = new PaymentReceived(msg.sender, msg.value); 
    }
}

// Transferring Payment from one contract to another 
// here firstly we called wallet contract to pay the contract with money 
// after that we called payment variable, which creates a new smart contract where the money is transferred 
// using at address in deploy field, we put the address of the smart contract created, to deploy that smart contract 
// after that, the way we put the type/format of that smart contract, it shows the field amount and from 
// and when we click. it will show the amount received, and from the address received. 
// here we are using sub contract/ child contract 
contract PaymentReceived{
    address public from;
    uint public amount;

    constructor(address _from, uint _amount){
        from = _from;
        amount = _amount; 
    }
}
// 0xcf49E9E66a280f347CFf4C958FFFbEa581937FED
// 0xcf49E9E66a280f347CFf4C958FFFbEa581937FED

contract Wallet2{

    struct PaymentReceivedStruct{
        address from;
        uint amount;
    }
    
    PaymentReceivedStruct public payment;  

    function payContract() public payable{
        // payment = PaymentReceivedStruct(msg.sender, msg.value); 
        payment.from = msg.sender;
        payment.amount = msg.value; 
    }
}