//SPDX-License-Identifier :MIT
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

   //modifier to restrict access to manager only
    modifier onlyManager() {
      require(msg.sender == manager, "Only manager can call this");
      _;
    }
    //modifiers to ensure actions are only perfomed during the lottery period
    modifier onlyDuringLottery() {
      require(block.timestamp>=lotteryStartTime && block.timestamp < lotteryStartTime + lotteryDuration, "Not during lottery session");
      _;
    }
    //constructor to initialze the contact with ticket price and lottery duration
    constructor (uint _ticketPrice, uint _lotteryDuration) {
      manager = msg.sender; //set conntract deployer as manager 
      ticketPrice =_ticketPrice; //set ticket price
      lotteryDuration =_lotteryDuration;  //set duration of each round
      startNewRound() ;//Start the first lottery round
    }
   //function to start new lottery round
      function startNewRound () view public onlyManager {
         //ensure previous round has ended or no players exist(no round to end)
         require(block.timestamp >= lotteryStartTime + lotteryDuration || players.length ==0 , "Previous round not yet finished");

      }
 }