// SPDX-License-Identifier: GPL-3.0
//how to use libarary in contracts

pragma solidity ^0.8.0;

library Calculater {
    function add(uint8 a, uint8 b) public pure returns (uint8) {
        return a + b;
    }
}

contract ContractA {
    using Calculater for uint8; //for adding all function to this type of variables. importent lien to understand.
    function Add2Numbers(uint8 a, uint8 b) public pure returns (uint8) {
        // return Calculater.add(a, b); //us can also use the second line but for that use line line 13 for adding all funcation to that type of variables.
        return a.add(b);
    }
}
