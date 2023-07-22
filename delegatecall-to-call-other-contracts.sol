// SPDX-License-Identifier: GPL-3.0
//delegatecall to call other contracts

pragma solidity ^0.8.0;

contract ContractB {
    uint256 public num;
    address public sender;
    uint256 public value;

    function updateVar(uint256 _num) public payable returns (bool) {
        num = _num;
        sender = msg.sender;
        value = msg.value;
        return true;
    }
}

contract ContractA {
    uint256 public num;
    address public sender;
    uint256 public value;

    function updateVar(
        address _contractAddress,
        uint256 _num
    ) public payable returns (bool, bytes memory) {//you can also use memory with bytes variable type.
        (bool success, bytes memory data) = _contractAddress.delegatecall(
            abi.encodeWithSignature("updateVar(uint256)", _num)
        );
        return (success, data);
    }
}
