// SPDX-License-Identifier: GPL-3.0
//sign other mathods and calling other mathods other contracts

pragma solidity ^0.8.0;

contract ContractA {
    bytes32 internal constant MY_STORAGE = keccak256("message.balanace");

    struct Storage {
        string message;
    }

    function getStorage() internal pure returns (Storage storage s) {
        bytes32 position = MY_STORAGE;
        assembly {
            s.slot := position
        }
    }

    function setMessage(string memory _msg) external {
        Storage storage s = getStorage();
        s.message = _msg;
    }

    function getMessage() external view returns (string memory) {
        return getStorage().message;
    }
}
