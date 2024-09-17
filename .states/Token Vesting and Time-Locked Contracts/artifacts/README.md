Token Vesting and Time-Locked Contracts

Project Overview

This project is designed to manage the controlled release of tokens over time or based on specific conditions. It includes two key components:

    1. Token Vesting: This feature ensures that tokens are released to recipients (like team members or investors) gradually, based on a predefined schedule. For example, instead of receiving all tokens upfront, they are unlocked over months or years.
    2. Time-Locked Contracts: This feature locks tokens so they cannot be accessed until a certain date or condition is met, offering extra security by preventing premature access to the funds.

The project helps ensure fairness, security, and transparency in the distribution of tokens, especially in scenarios like fundraising or employee compensation.



Here are the files for this project

    1. Token.sol  
          Contains the token contract
    2. Vesting.sol
          This  file will handles the  logic for vesting over time, managing beneficiary addresses, releases schedules and conditoions
    3. TimeLock.sol
          This contract wll manage time-locked token transfer, where tokens can not be accessed until a certain time or condition is met
    4. Migrations.sol
           A helper contract  for managing deployment migrations. 
    5.  Helpers.sol
           Helper contract to include custom math functions needed for calculations related to vesting or time locks
    6. TokenTest.js
            JS file for testin the token contract
    7. VestingTest.js
            Testing file for the vesting contract
    8.  TimelockTest.js
             Test file for timelock contract
    9.  Deployment_script.js
                A deployment script for deploying contracts to a blockchain  network
    10. hardhat.config.js / truffle-config.js
                The configuration file for the chosen development environment
           
        

