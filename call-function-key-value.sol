// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Call Functions with Key Value Inputs
contract Contract {
    function method1(uint8 x, uint8 y, string memory value) public pure returns (uint8, uint8, string memory) {
        return (x, y, value);
    }

    function method2(uint8 x, uint8 y, string memory value) public pure returns (uint8, uint8, string memory) {
        return method1({x: x, y: y, value: value});
    }
}
