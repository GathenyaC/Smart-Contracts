//SPDX-License-Identifier:MIT
const Web3 = require ('web3');
const web3 = new web3();

const sender = '0x1Aaddress';
const recipient ='0xBaddress';
const amount = web3.utils.toWei('1.5', 'ether');
const nonce = 123456;  //prevent replay attacks
const expiration = Math.floor(new Date ('2024-10-10T00:00:00Z').getTime()/1000);

// Hash the message
 const messageHash = web3.utils.soliditySh3(
    {type: 'address', value :sender},
    {type: 'address', value : recepient},
    {type: 'uint256', value : amount},
    {type: 'uint256', value : nonce},
    {type: 'uint256', value : expiration};
 )
 // Output the message hash
console.log(`Message Hash: ${messageHash}`);

 /*By hashing the message in this way,
  both Alice (off-chain) and the smart contract (on-chain) can recreate the same message, 
 ensuring that the off-chain signed message is securely verified when presented on-chain.*/