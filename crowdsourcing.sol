// SPDX-License-Identifier: MIT
pragma solidity  0.8.24;

contract  crowdsourcing2{ 
    address public owner;
    uint256 public goal;
    uint256 public totalAmount;
    mapping  (address=> uint256) public contributions;
    bool public  goalReached;

    event goalReachedEvent(uint256 totalAmount);


//constructor function initializes two variables: 
// 1. owner with the address of the message sender (msg.sender), 
//2. goal with the value passed as _goal.

    constructor(uint256 _goal) {
        owner =msg.sender;
        goal = _goal;
    }
function contribute () public payable {    //Declares a function named contribute that is accessible from outside the contract and can receive Ether.
    require (!goalReached, "Goal  already reached"); //Checks if the goalReached variable is false. If it's true, it aborts the function execution and reverts the transaction, displaying the error message "Goal already reached".
    contributions [msg.sender] +=msg.value; //Increases the contribution amount of the sender (msg.sender) by the value sent with the transaction (msg.value). It adds the contribution to the contributions mapping.
    totalAmount +=msg.value; //This variable, of type uint256 (unsigned integer), accumulates the total amount of Ether contributed to the fundraising campaign. It's the sum of all individual contributions.
    if (totalAmount >=goal) {
        goalReached=true;
        emit goalReachedEvent(totalAmount);
    }
}

  function withdraw() public {
        require (goalReached, "Goal not reached");
        require (msg.sender == owner, "Only owner can withdraw");
        payable (msg.sender).transfer (totalAmount);
    }

}