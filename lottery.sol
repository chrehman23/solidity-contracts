//SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract Lottery {
    address payable[] public players;
    address public manger;

    constructor() {
        manger = msg.sender;
    }

    receive() external payable {
        require(msg.value >= 2 ether, "Value is not valied");
        players.push(payable(msg.sender));
    }

    function getLotteryBalance() public view returns (uint256) {
        require(msg.sender == manger, "You are not manger.");
        return address(this).balance;
    }

    function pickWiner() public returns (address) {
        require(players.length > 1, "Atleast one player requred.");
        require(getLotteryBalance() > 2 ether, "There is no any balance.");
        uint256 r = random();
        uint256 index = r % players.length; //main logic is here.
        address payable winner = players[index];
        winner.transfer(getLotteryBalance());
        players = new address payable[](0); //import
        return winner;
    }

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }
}
