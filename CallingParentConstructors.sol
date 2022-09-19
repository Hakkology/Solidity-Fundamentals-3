// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 2 ways to call parent constructors
// Order of Initialization

contract S{
    string public name;

    constructor (string memory _name) {
        name = _name;
    }
}

contract T{
    string public text;

    constructor (string memory _text) {
        text = _text;
    }
}

contract U is S("S"), T("T") {

}

contract V is S, T{
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

contract W is S("s"),T {
    constructor(string memory _name, string memory _text) T(_text) {

    }
}

// Order of Execution
// S
// T - order of inheritence
// V0

contract V0 is S, T{
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}