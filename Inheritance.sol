// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// You can access the video content in Turkish prepared by İTÜ Blockchain here:  
// https://www.youtube.com/watch?v=KSrhlrHlti4&list=PLby2HXktGwN4Cof_6a8YwlMrboX8-hs73&index=15&t=2s 

// When creating a smart contract, we can take advantage of all the functions of another smart contract by using the inheritance feature. 
// The inclusion of contracts within each other allows writing of clean and understandable code, as in library usage. 
// When a contract inherits from other contracts, only a single contract is created on the blockchain, and the code from all the base contracts is compiled into the created contract. 
// Solidity is a programming language that supports multiple inheritances. 

// "is, virtual, override" keywords used for inheritance:

// Contracts can inherit other contracts using the ‘is’ keyword. (example: “contract B is A {}”)

// virtual: The qualifier that indicates that the function can be overridden by a subcontract.

// override: The qualifier that tells us to override and redefine functions marked with virtual in a base contract.

// The general inheritance system is very similar to Python’s, especially concerning multiple inheritance, but there are also some differences.

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory){
        return "A"
    }
}

contract B is A {
    function foo() public pure override returns (string memory) {
        return "A";
    }

    function bar() public pure virtual override returns (string memory) {
        return "A";
    }
}

contract C is B {
        function bar() public pure override returns (string memory) {
        return "C";
    }
}