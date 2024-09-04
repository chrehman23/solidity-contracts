//SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

interface A {
    function setx() external;
}

contract B is A {
    uint256 public x = 0;

    function setx() external override {
        x = 1;
    }
}
