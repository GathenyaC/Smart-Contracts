// SPDX-License-Identifier : MIT
pragma solidity 0.8.24;

//1. Define the Players
 contract Escrow {
        address  public buyer;
        address public seller;
        address public escrowAgent;
 
 //2. Define contract state variables
        uint public escrowAmount; 

       //determine state of contract
       enum contractState{Active, Closed, Failed}
       contractState public currentState; //The current state is stored in the currentState variable.
       //3. Constructor function to initialize the contract state variables and set the initial state to Active and set the escrowAgent as the owner of the contract.  
 constructor() payable{
         currentState = contractState.Active; //Set the initial state to Active.
         escrowAgent = msg.sender; //Set the escrowAgent to the owner of the contract.
 }

 }
