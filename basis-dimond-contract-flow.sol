// SPDX-License-Identifier: GPL-3.0
//sign other mathods and calling other mathods other contracts

pragma solidity ^0.8.0;

contract WriteMessage {
    bytes32 internal constant MY_STORAGE = keccak256("message.balanace");

    struct Storage {
        uint256 number;
    }

    function getStorage() internal pure returns (Storage storage s) {
        bytes32 position = MY_STORAGE;
        assembly {
            s.slot := position
        }
    }

    function setDelegatecall(address _contractAddress)
        public
        returns (bool, bytes memory)
    {
        (bool success, bytes memory data) = _contractAddress.delegatecall(
            abi.encodeWithSignature("updateNumber()")
        );
        return (success, data);
    }

    function getNumber() external view returns (uint256) {
        return getStorage().number;
    }
}

contract SecondContract {
    bytes32 internal constant MY_STORAGE = keccak256("message.balanace");

    struct Storage {
        uint256 number;
    }

    function getStorage() internal pure returns (Storage storage s) {
        bytes32 position = MY_STORAGE;
        assembly {
            s.slot := position
        }
    }

    function updateNumber() public {
        Storage storage s = getStorage();
        s.number += 5;
    }
}
