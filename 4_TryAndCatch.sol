// SPDX-License-Identifier:MIT
pragma solidity 0.8.15;

contract TryAndCatch{

    error NotAllowedError(string); 

    function MyFunction() public pure{
        // require(false, "This is a error!");
        // assert(false); 
        revert NotAllowedError("You are not allowed"); 
    }

}

contract ErrorHandling{

    event ErrorLogging(string reason); 
    event ErrorLogCode(uint code); 
    event ErrorLogBytes(bytes lowLevelData); 

    function catchTheError() public{
        TryAndCatch x = new TryAndCatch();
        try x.MyFunction(){

        } 
        catch Error(string memory reason){
            emit ErrorLogging(reason); 
        }
        catch Panic(uint errorCode){
            emit ErrorLogCode(errorCode); 
        }
        catch (bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData); 
        }
    }
}