// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    // Declare an array of 4 candidates
    Candidate[4] public candidates;

    // Mapping to keep track of addresses that have already voted
    mapping(address => bool) public hasVoted;

    // Constructor to initialize the candidates
    constructor() {
        candidates[0] = Candidate("Ruto", 0); // Fixed the incorrect voteCount initialization
        candidates[1] = Candidate("Raila", 0);
        candidates[2] = Candidate("Wajakoya", 0);
        candidates[3] = Candidate("Mwaura", 0);
    }

    // Function to allow voting
    function vote(uint candidateIndex) external {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount += 1;
    }

    // Function to get the winner
    function getWinner() external view returns (string memory winnerName, uint winnerVoteCount) {
        uint winningVoteCount = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        winnerName = candidates[winnerIndex].name;
        winnerVoteCount = winningVoteCount;
    }
}
