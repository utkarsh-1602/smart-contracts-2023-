// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

contract ExampleMapping3{

    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable{
        balanceReceived[msg.sender] += msg.value; // now here were are mapping (keeping a record) how much money is being sent
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public{ // here we are following this approach to avoid reentrancy attack 
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg .sender] = 0;
        _to.transfer(balanceToSendOut); 
    }

    //This is a secure smart contract
    // you cannot withdraw more money that you've actually put in 
    // you cannot witdraw someone's else money 
    // here You can only withdraw the money from smartcontract to your account, that much you've deposited 

}