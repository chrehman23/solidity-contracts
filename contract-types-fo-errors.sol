// SPDX-License-Identifier: GPL-3.0
//calling with fallback method to have some events with errors of other contracts and returns methods

pragma solidity ^0.8.0;

contract ContractA {
    uint256 public number;

    function checkValue(uint256 _number) public returns (bool) {
        require(_number <= 10, "Number is grater then 10"); //this requre statment will not go to next line
        number = _number;
        return true;
    }

    function checkValue2(uint256 _number) public returns (bool) {
        number = _number;
        if (_number > 10) {
            revert("Number is grater then 10"); //this will revert all the things done in this funcation.
        }
        return true;
    }

    function checkValue3(uint256 _number) public returns (bool) {
        number = _number;
        assert(_number == 10);
        if (_number > 10) {
            number = 5;
        }
        return true;
    }

    error MyError(address sender, uint256 number); //custom user define errors.

    function customError(uint256 _number) public returns (bool) {
        number = _number;
        if (_number > 10) {
            revert MyError(msg.sender, _number);
        }
        return true;
    }
}
