// SPDX-License-Identifier: GPL-3.0
//calling with fallback method to have some events with errors of other contracts and returns methods

pragma solidity ^0.8.0;

contract ContractA {
    string public message;
    uint256 public number;

    event ErrorLog(string message);

    fallback() external {
        emit ErrorLog("Fallback emited due to error.");
    }

    function callingMethod(string memory _message, uint256 _x)public payable returns (bool){
        message = _message;
        number = _x;
        return true;
    }
}

contract ContractB {
    bytes public data;

    function callingMethod(address _contractAddress) public payable returns (bool) {
        //if you have uint in calling other method. you have to use always uint256
        (bool success, bytes memory _data) = _contractAddress.call{value: 111}(
            abi.encodeWithSignature("callingMethod(string,uint256)","message gose here",123)
        );
        require(success, "Transaction is not fullfilled.");
        data = _data;
        return true;
    }

    function errorMethod(address _contractAddress) public payable returns (bool) {
        //if you have uint in calling other method. you have to use always uint256
        (bool success, bytes memory _data) = _contractAddress.call{value: 111}(
            abi.encodeWithSignature("errorMessage(string,uint256)","message gose here",123)
        );
        require(success, "Transaction is not fullfilled.");
        data = _data;
        return true;
    }
}
