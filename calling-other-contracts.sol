// SPDX-License-Identifier: GPL-3.0
//calling types of other contracts and returns methods

pragma solidity ^0.8.0;

contract CallerContract {
    function setX(address _contractAdress, string memory _x) public returns (bool) {
        ContractA(_contractAdress).updateXvalue(_x);
        return true;
    }

    function updateValue(ContractA _contractAdress) public payable returns (bool) {
        //you can also call contract by changing input function contract type
        _contractAdress.updateValue{value: msg.value}();
        return true;
    }

    function updateXandValue(address _contractAdress, string memory _x) public payable {
        ContractA(_contractAdress).updateXandValue{value: msg.value}(_x);
    }
}

contract ContractA {
    string public x;
    uint256 public value;

    function updateXvalue(string memory _x) public {
        x = _x;
    }

    function updateValue() public payable {
        value = msg.value;
    }

    function updateXandValue(string memory _x) public payable {
        x = _x;
        value = msg.value;
    }
}
