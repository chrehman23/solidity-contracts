// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract DeployAbleContract {
    uint8 anyNumber = 10;
    address deployerAddress = msg.sender;
}

contract contractA {
    DeployAbleContract[] public deployContracts;  //variable type is importent

    function deployNewContract() public returns (DeployAbleContract) {
        DeployAbleContract deploy = new DeployAbleContract(); //stroing result in variable type is omprotent
        deployContracts.push(deploy); //save all contract address to on variable to have activey history
        return deploy; //treturn contract addresses to other contracts or method to have next activity
    }
}
