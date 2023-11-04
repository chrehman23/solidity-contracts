// SPDX-License-Identifier: GPL-3.0
//sign other mathods and calling other mathods other contracts

pragma solidity ^0.8.0;

contract ContractA {
    uint256 public number;
    uint256 public value;
    address public senderAddress;

    //functionalty for deligate calls not for simple calls
    function updateValue(uint256 _number) public payable returns (uint256) {
        number = _number;
        senderAddress = msg.sender;
        value = msg.value;
        return number;
    }
}

contract ContractB {
    uint256 public number;
    event Log(uint256 indexed number, address contractAddress);//to get back return data with logs in transaction hash

    function simpleCall(ContractA _contractAddress, uint256 _number)
        public
        payable
        returns (bool, bytes memory)
    {
        bytes memory methodWithData = abi.encodeWithSignature("updateValue(uint256)",_number);
        (bool success, bytes memory data) = address(_contractAddress).call{value: msg.value}(methodWithData);
        return (success, data);
    }

    // ***************deligate types *************************
    //this will update your local file
    function delegatecall(address _contractAddress, uint256 _num)public payable returns (bool, bytes memory){
        bytes memory methodWithData = abi.encodeWithSignature("updateValue(uint256)",_num);
        (bool success, bytes memory data) = _contractAddress.delegatecall(  methodWithData);
        emit Log(_num, _contractAddress); //to get back return data with logs in transaction hash
        return (success, data);
    }

    //this will update your local file with another way of selector
    function delegatecallWithSelector(address _contractAddress, uint256 _num) public payable returns (bool, bytes memory){
        bytes memory methodWithData = abi.encodeWithSelector(ContractA.updateValue.selector,_num);
        (bool success, bytes memory data) = _contractAddress.delegatecall(methodWithData);
        emit Log(_num, _contractAddress); //to get back return data with logs in transaction hash
        return (success, data);
    }
}
