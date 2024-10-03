// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IPFSStorage {
    string public ipfsHash;

    // Function to store the IPFS hash
    function setIPFSHash(string memory _ipfsHash) public {
        ipfsHash = _ipfsHash;
    }

    // Function to retrieve the stored IPFS hash
    function getIPFSHash() public view returns (string memory) {
        return ipfsHash;
    }
}
