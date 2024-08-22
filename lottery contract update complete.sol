
// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

 import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

    contract Lottery {
        address public manager;
   //Array of the contract manager who can control the contract ,start rounds....

    //Array of addressez of players who bought tickets
    address [] public players;

    //mapping from player address to the number of tickets they have purchased
    mapping (address => uint)  public tickets;

    //price each ticket in Wei
    uint  public ticketPrice;

    //current round number
    uint public round;

   // Duration of each duration round in secs
   uint public lotteryDuration;

   //start time of current lottery round
   uint public lotteryStartTime;

    //Events emitted when a player purchases a ticket
    event TicketPurchased (address indexed player, uint ticketCount);

    //event emitted whena winner is selected and rewarded
    event winnerSelected(address indexed winner, uint prizeAmount, uint round);
     //modifier to restrict access only to manger
     modifier  onlyManager (){
      require (msg.sender == manager, "Only manager can call this");
      _;
     }
     //modifier to ensure actions are only perfomed during the lottery period
     modifier onlyDuringLottery (){
      require(block.timestamp >= lotteryStartTime && block.timestamp <= lotteryStartTime + lotteryDuration, "Lottery has not started yet");
      _;
     }
     //constructor to initialize the contract with ticket price and lottery duration
     constructor (uint _ticketPrice, uint _lotteryDuration) {
      manager =msg.sender;  //set contract deployer as the manager
      ticketPrice = _ticketPrice; //set ticket price to the price given as parameter in constructor
      lotteryDuration = _lotteryDuration; //set lottery duration to the duration given as parameter in constructor
       startNewRound(); //start 1st lottery round
     }
     //function to start new lottery round
     function startNewRound() public onlyManager {
    // ensure previous round has ended and no existing players
    require(block.timestamp >= lotteryStartTime + lotteryDuration || players.length == 0, "Previous round not yet finished");
    
    // reset all ticket counts to zero
    for (uint i = 0; i < players.length; i++) {
        tickets[players[i]] = 0; 
    }

    lotteryStartTime = block.timestamp;
    round++; // increment the round number
}
     }
     //function to buy lotttery tickets
     function buyTickets (uint numberofTickets) external payable onlyDuringLottery {
      require (msg.value ==numberofTickets * ticketPrice, "Incorrect Ether amount"); //ensure correct ether sent
      //ensure that the number of tickets is not greater than the remaining tickets in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
       //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
       //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
       //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
       //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
      require (tickets[msg.sender] + numberofTickets <= IERC721(manager).balanceOf(address(this)),"Not enough tickets"); //ensure that the number of tickets is not greater than the number of tickets available for sale in the contract
     
     //add the player's address to each ticket purchase
     for (uint i =0 ; i<numberofTickets; i++) {
      players.push(msg.sender);
     }
     tickets[msg.sender] += numberofTickets;  //update the number of tickets for each player

    emit TicketPurchased(msg.sender , numberofTickets) ; //emit event for ticket purchased
     }

          // Function to select a winner and distribute the prize
        function selectWinner() external onlyManager {
          //ensure lottery period  has ended
         require(block.timestamp >= lotteryStartTime +lotteryDuration, "Lottery perios not yet finished");
          require(players.length >0, "No players in the lottery"); //ensue there are players

          uint randomIndex =random( )% players.length;  //select a random index from players array to select a winner of the lottery round
          address winner =players[randomIndex]; //get winners address
          uint prizeAmount =address(this).balance; //calculate the prize amount
          //emit winner
          emit winnerSelected(winner , prizeAmount , round); //emit event for winner selected and prize amount

          //transfer amount prize to winner
          payable(winner).transfer(prizeAmount);

          //start new lottery round after selecting winner
          startNewRound(); 

        }
        //function to generate a random number
        function  random() private view returns (uint)  {
          uint seed = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, block.gaslimit, msg.sender, players))); //generate random number using blockchain information
          return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, block.gaslimit, msg.sender, players, seed))); //return random number
        } //not so sucure , more suitable- ''Chainlink VRF'' or a ''hardware RNG''

    //Function to get list of player is current round
       function getPlayers () external view returns (address [] memory) {
        return players ; //return the list of players in the current round
       }

       //function to get the price of a single lottery tickets
       function getTicketsPrice () external view returns (uint) {
        return ticketPrice ; //return the price of a single lottery tickets 
       }
       //function to get current round number
       function getCurrentRound () external view returns (uint) {
        return round;
       }
       // function to get time remaining in current round
       function getRemainingTime () external view returns (uint) {
        if (block.timestamp >= lotteryStartTime + lotteryDuration) {
          return 0; //no time remaining if round has ended
          } else {
          return lotteryStartTime + lotteryDuration - block.timestamp ; //calculate the time remaining in the round
        }
       
       //falback function to accept Ether sent to contract
     receive ()external payable{}
     }

 
