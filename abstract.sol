//SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

abstract contract A {
    uint256 public y = 2;

    function setx() public virtual;
}

contract B is A {
    uint256 public x = 1;

    function setx() public override {
        x = 2;
        y = 33;
    }
}
