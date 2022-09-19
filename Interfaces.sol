// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// You can access the video content in Turkish prepared by İTÜ Blockchain here:  
// https://www.youtube.com/watch?v=QZDvZD-lczM&list=PLby2HXktGwN4Cof_6a8YwlMrboX8-hs73&index=17 

// Interfaces allow contracts (for example, token contracts) that have different working logic but do the same job to have a common standard, 
// so that someone who wants to work with these contracts writes a single code according to this standard instead of writing code specific to each contract.

// You can interact with other contracts by declaring an Interface.

// Interfaces:

// Cannot have any functions implemented
// Can inherit from other interfaces
// Declared functions must be external
// Cannot declare state variables
// Cannot declare a constructor

// Standards such as ERC20, ERC721, ERC1155 are actually defined as an interface.

// contract counter {
//     uint public count;

//     function inc() external {
//         count += 1;
//     }

//     function dec() external {
//         count -= 1;
//     }
// }

contract Counter {
    uint public count;

    function inc() external {
        count+=1;
    }

    function dec() external {
        count -=1;
    }
}

interface ICounter { //call other Contracts without having to deploy
    function count() external view returns (uint);
    function inc() external;
}

contract CallInterface {
    uint public count; 

    function examples (address _counter) external {
        ICounter(_counter).inc();
        count =ICounter(_counter).count();
    }
}