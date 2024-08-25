// SPDX-License-Identifier : MIT
pragma solidity 0.8.25;

//1. Define the Players
 contract Escrow {
        address  public buyer;
        address public seller;
        address public escrowAgent;
 
 //2. Define contract state variables
        uint public escrowAmount; 
            // Variables to track confirmation statuses
    bool public buyerConfirmed;  // Tracks if the buyer has confirmed delivery
    bool public sellerConfirmed; // Tracks if the seller has confirmed delivery
       // Events
       event DisputeRaised(address indexed by);
       event DisputeResolved(address indexed winner, uint amount);
       event FundsReleased(address indexed to, uint amount); // Event declaration

       // Enum to track the state of the contract
       //determine state of contract
       enum contractState{Active, Closed, Failed}
       contractState public currentState; //The current state is stored in the currentState variable.



//3. Constructor function to initialize the contract state variables and set the initial state to Active and set the escrowAgent as the owner of the contract.  
 constructor() payable{
         currentState = contractState.Active; //Set the initial state to Active.
         escrowAgent = msg.sender; //Set the escrowAgent to the owner of the contract.
 }
              uint public isDispute;
              uint public feePercentage;
              uint public Deadline;
              uint public amountPaidInEscrow;

//4. Implement deposit function 
       function deposit () external  payable {
              require (msg.sender == buyer, "Only buyer can deposit funds");
              require(currentState == contractState.Active, "Contract must be in active state to deposit funds");
              require(msg.value>0, "Amount must be greater than zero");
              
       }

//5. implemetnt function for seller  to confirm deliverly
       function confirmDelivery () external payable {
              require(msg.sender == seller,"Only seller can condirm deliverly");
              require(currentState ==contractState.Active, "Contract has to be active");
              require(msg.value ==escrowAmount,"Contract amount has to paid in full");
              sellerConfirmed = true;
        tryToFinalize();
       }
       //implement function for buyer to confrim deliverly
       function confirmDeliverlyByBuyer() external {
              require(msg.sender == buyer,"Only buyer can confirm deliverly"); 
              require(currentState == contractState.Active, "Contract must be in active state to confirm deliverly");
                // Internal function to check if both parties have confirmed and finalize the transaction
  
       // If both buyer and seller have confirmed, finalize the transaction
          buyerConfirmed = true;
        tryToFinalize();
       }
         function tryToFinalize() internal {
        if (buyerConfirmed && sellerConfirmed) {
            finalizeTransaction(); // Calls finalizeTransaction if conditions are met
        }
         }

    // Internal function to finalize the transaction
    function finalizeTransaction() internal {
        require(currentState == contractState.Active, "Contract is not active"); // Ensure contract is active before finalizing
        require(currentState == contractState.Closed);
        payable(seller).transfer(escrowAmount); // Transfer funds to the seller
        escrowAmount = 0; // Reset the escrow amount
        emit FundsReleased(seller, escrowAmount); // Emit event for funds release
    }


//6. 


         
 }