// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Voting {

    struct Candidate{
        string name;
        string party;
        string imageUri;
    }

    uint256 public candidateCount;
    mapping(uint256 => Candidate) public candidates;
    // 1 => Candidate #1
    // 2 => Candidate #2

    address public owner;

    mapping(uint256 => uint256) public votes;
    uint256 public totalVotes;

    constructor(){
        owner = msg.sender;
    }

    // we will keep a mapping of total votes 
    // we will keep a mapping of candidate index to number of votes he/she has received 

    function addCandidate(string calldata name, string calldata party, string calldata imageUri) public{
        // the parameters name, party, and imageUri are declared as calldata to indicate that they will be read from the input data without modification.
        require(owner == msg.sender, "Not the Owner of the contract");
        candidateCount++;
        Candidate memory person = Candidate({name: name, party: party, imageUri: imageUri});
        candidates[candidateCount] = person;  
    }

    function vote(uint256 id) public{
        require(id > 0, "Candidate doesn't Exist");
        require(id <= candidateCount, "Candidate doesn't exist");
        votes[id]++;
        totalVotes++; 
    }

}
