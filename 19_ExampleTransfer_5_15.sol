// SPDX-License-Identifier: MIT 
pragma solidity 0.8.15;

contract Sender{

    receive() external payable{}

    function withdrawTransfer(address payable _to) public{
        _to.transfer(10); 
        // the transfer function will throw and exception or error when the transfer fails
    }

    function withdrawSend(address payable _to) public{
        bool isSent = _to.send(10);
        require(isSent, "Sending the funds was unsuccessful!"); 

        // the send function will return a boolean value if the transaction fails 
    }
}

contract ReceiverNoAction{

    receive() external payable {}

    function balance() public view returns(uint){
        return address(this).balance; 
    }

}

contract ReceiverAction{

    uint public balanceReceived; 

    receive() external payable{
        balanceReceived += msg.value; 
    }

    function balance() public view returns(uint){
        return address(this).balance; 
    }
}


