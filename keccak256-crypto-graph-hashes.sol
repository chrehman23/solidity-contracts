// SPDX-License-Identifier: GPL-3.0
//crypto graph funcations

pragma solidity ^0.8.0;

contract contractA {
    function hash(string memory text, string memory text2)public pure returns (bytes32){
        // keccak256(arrguments) // this will take always arrguments in bytes so thats why we have to convert other type of datain to bytes thats why we have to use abi.encodePacked this will give you data in bytes32
        return keccak256(abi.encodePacked(text, text2));
        //this abi.encode(arg); just only use to convert all types of data into bytes32 because keccak256 only takes data in bytes32 only
    }

    function encode(string memory text, string memory text2)public pure returns (bytes memory){
        return abi.encodePacked(text, text2);
    }

    function encodePacked(string memory text, string memory text2)public pure returns (bytes memory){
        return abi.encode(text, text2);
    }

    function collision( string memory text,uint256 x,string memory text2) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, x, text2));
    }

    function concatinateStrings( string memory text,string memory text2) public pure returns (string memory) {
        return string(abi.encodePacked(text, text2));
    }
}
