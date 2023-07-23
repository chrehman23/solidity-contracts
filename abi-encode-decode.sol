// SPDX-License-Identifier: GPL-3.0
//abi endcode and decode

pragma solidity ^0.8.0;

contract ContractA {
    struct AbiStruct {
        string name;
        uint256 number;
    }

    function abiEncode(string memory _message,uint256 _number,AbiStruct calldata _struct ) public pure returns (bytes memory) {
        return abi.encode(_message, _number, _struct);
    }

    //be carefull when sending bytes to function
    function abiDecode(bytes calldata _data) public pure returns (  string memory message, uint256 number, AbiStruct memory structs ){
        (message, number, structs) = abi.decode(_data,(string, uint256, AbiStruct));
    }
}
