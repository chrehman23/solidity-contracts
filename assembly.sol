// SPDX-License-Identifier: GPL-3.0
//Write or read in assemble  to call other contracts

pragma solidity ^0.8.0;

contract contractA {
    uint public a;
    uint public b;

    // how to add 2 numbers in solidity
    function add2Numbers() public pure returns (uint c) {
        assembly {
            c := add(1, 2) //this will return sum of 1 and 2 with result of 3;
        }
    }

    // how to add 2 numbers in solidity
    function div2Numbers() public pure returns (uint c) {
        assembly {
            c := div(10, 2) //this will return sum of 10 and 2 with result of 5;
        }
    }

    // update memory variable value in assembly
    function updateStateInAssembly() public pure returns (uint) {
        uint m = 55;
        assembly {
            m := 88
        }
        return m;
    }

    // read hex type valuesin assembly
    function readhexType() public pure returns (uint) {
        uint m;
        assembly {
            m := 0xc // this text means 12;
        }
        return m;
    }

    // read hex type valuesin assembly
    function readUintype() public pure returns (uint) {
        uint m;
        assembly {
            m := "helow" // this text will update m value but we can not read its output;
        }
        // 47219736199894017351281991086078543207774158083441458312216772923925177827328 //this will its output due to uint type
        return m;
    }

    // facing error with string in assembly
    function readStringType() public pure returns (string memory) {
        string memory m;
        assembly {
            m := "helow" // this text will update m value but we can not read its output;
        }
        // this wil //this will gives run outOf gass error.
        return m;
    }

    // fixing error with string in assembly
    function fixStringtype() public pure returns (string memory) {
        bytes32 m;
        assembly {
            m := "helow" // this text will update m value but we can not read its output;
        }
        // this wil //this will gives you encoded data but we can convert again back to string.
        return string(abi.encode(m));
    }

    // bool in assembly
    function boolType() public pure returns (bool) {
        bool m;
        assembly {
            m := true // 1,0,true,false this will update value of memory variable
        }
        // this wil //this will gives you encoded data but we can convert again back to string.
        return m;
    }

    // address in assembly
    function addressType() public pure returns (address) {
        address m;
        assembly {
            m := 1 // 1,0,true,false this will update value of memory variable
        }
        // this wil //this will gives you address with last digets values
        // 0x0000000000000000000000000000000000000001
        return m;
    }

    // if condtion in assembly
    function ifConditionType() public pure returns (uint) {
        uint m;
        assembly {
            if true {
                m := 100
            }
        }
        // this wil //this will gives you address with last digets values
        // 0x0000000000000000000000000000000000000001
        return m;
    }

    //notZero
    function notZero() public pure returns (bytes32 r) {
        assembly {
            r := not(0)
        }
        // this will return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff to max value in excicution
    }
}
