// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Selector {
    function getSelector() public pure returns (bytes calldata) {
        return msg.data;
    }

    function singer(
        string calldata _data
    ) public pure returns (bytes memory, bytes4, bytes calldata, bytes4) {
        return (
            abi.encodeWithSelector(msg.sig), //this will give function own hash
            bytes4(msg.data), //this will also give function own hash
            msg.data, //this will also give function own hash
            bytes4(keccak256(bytes(_data))) //this will give any any funtion hash with its types like this "singer()" input for this funtion
        );
    }
}
// 0x034899bc
// 0x799a25fe0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000873696e6765722829000000000000000000000000000000000000000000000000
// 0x0db7a132
