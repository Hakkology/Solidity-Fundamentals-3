// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*This video explains 3 ways to send ETH in Solidity: transfer, send and call.

send - 2300 gas, returns bool,
call - all gas, returns bool and data

A contract receiving Ether must have at least one of the functions below:

receive() external payable
fallback() external payable
receive() is called if msg.data is empty, otherwise fallback() is called. 
If neither a receive Ether nor a payable fallback function is present, 
the contract cannot receive Ether through regular transactions and throws an exception.

transfer: There is a gas limit of 2300 gas and it throws an error if there isn’t any receive and fallback functions. 
It is hardcoded to prevent reentrancy attacks.
send: There is a gas limit of 2300 gas and it returns a bool if there isn’t any receive and fallback functions.
call: It is the recommended way of transferring ETH, because we can set the amount of gas to be sent. 
It also returns a bool if there isn’t any receive and fallback functions. 
However, you should be extra careful when using “call” in a contract since it allows reentrancy attacks. 
If the sender contract is improperly coded, it can result in draining larger amounts of funds from it than planned. */

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer (address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "transaction failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call transaction failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}