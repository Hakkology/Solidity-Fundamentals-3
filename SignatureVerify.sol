// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/* Cyrptographic signatures have many different use cases like ownership, payments, authorization, etc. 
The combination of signatures and smart contracts allows payments to be made off chain. 
Messages can be signed off chain and then verified on chain using a smart contract like writing checks to pay for a product or service. 

Keccak 256 algorithm ?????
Vid is terrible.

0. message to sign
1. hash (message)
2. sign(hash(message), private key) | offchain
3. ecrecover (hash(message), signature ==signer */



contract VerifySig {
    function verify(address _signer, string memory _message, bytes memory _sign) external pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sign) == _signer;
    }

    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

    function recover (bytes32 _ethSignedMessageHash, bytes memory _sign) public pure returns (address){
        (bytes32 r, bytes32 s, uint8 v) = _split(_sign);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }
    
    function _split (bytes memory _sign) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sign.length == 65, "Invalid signature length");
        assembly {
            r := mload(add(_sign, 32))
            s := mload(add(_sign, 64))
            v := byte(0, mload(add(_sign, 96)))
        }
    }
}

