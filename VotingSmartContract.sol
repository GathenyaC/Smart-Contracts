// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Ballot {
    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal{
        bytes32 name;
        uint voteCount; //number of accumilated votes
    }

    address public chairperson; //declares a public state variable chairperson, which holds the Ethereum address of the chairperson

    mapping (address => Voter) public voters;
    Proposal [] public proposals;

    //create a new ballot to choose one of the proposalNames
    constructor(bytes32[] memory proposalNames) {           //memory keyword indicates that the array is located in memory, and it's temporary.
        chairperson = msg.sender; //sets the chairperson address to the deployer's address.
        voters[chairperson].weight = 1; //It gives the chairperson a voting weight of 1.

        for (uint i = 0; i<proposalNames.length;i++){
            proposals.push (Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }

        //
    }

}