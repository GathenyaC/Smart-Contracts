// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
 
   contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }
    Candidate[4] public candidates;
     mapping  (address => bool)public hasVoted;

     constructor() {
         candidates[0] = Candidate("Ruto", "0");
         candidates[1] = Candidate("Raila", "0");
         candidates[2] = Candidate("Wjakoya", "0");
         candidates[3] = Candidate("Mwaura", "0");
     }
     function vote(uint candidateIndex) external {
        require (!hasVoted[msg.sender], "You have already voted");

        require(candidateIndex < candidates.length, "Invalid candidate");
        hasVoted[msg.sender] =true;

        candidates[candidateIndex] .voteCount +=1;
     }
       function getWinner() external  view returns (string memory winnerName, uint winnerVoteCount){
        uint winningVoteCount = 0;
        uint winnerIndex = 0 ;

        for (uint i = 0; i<candidates.length; i++) {
            winningVoteCount =candidates [i] .voteCount;{
            winnerIndex =i;
        }
    }

    winnerName = candidates [winnerIndex] .name;
    winnerVoteCount = winningVoteCount; 
       }
   }
