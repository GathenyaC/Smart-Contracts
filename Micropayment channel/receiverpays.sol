// SPDX-license-Identifier: MIT
pragma solidity ^0.8.24;
    contract OffChainEtherTransfer {
        //store a mapping of nonces to prevetn replay attacks
        mapping (address=>uint256) public nonces;
        //event for logging successful Ether transfers
        event EtherClaimed(address indexed sender, address indexed receipient, uint amount);

        //verify off chain signature and transfer Ether to receipent
        function ClaimEther(
            address sender,
            address recepient,
            uint256 amount,
            uint256 nonce,
            uint256 expiration,
            bytes memory signature
        )
        external{
            //ensure signature has not expired
            require (block.timestamp <= expiration, "Signature has expired");

            //Ensure nonce is correct to prevent replay attacks
            require(noonce== nonces[sender], "Invalid none");

            //Constract the message that was signed by A
            bytes32 messageHash =getMessageHash (sender, recepient, amount, nonce, expiration);
            bytes32 ethSignedMessageHash =getEthSignedMessageHash(messageHasg);

            //recover the signer's address using the provided signature
            address recoveredSigner = recoverSigner(ethMessageHash, bytes memory signature);
            require(recoveredSigner == sender, "Signature not valid");
                public 
                pure 
                returns (address)
                {
                    (bytes32 r, bytes32 s, bytes32 v) =splitSignature(signature);
                    return ecrecover(ethSignedMessageHash, v, r, s);
                }
                //
        }



    }