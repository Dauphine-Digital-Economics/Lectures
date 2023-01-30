// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract If {
    function decimalToBinary(uint decimal) public returns(string memory){
        if (decimal >= 4){
            return "Error: input too large";
        }

        if (decimal == 0){
            return "00";
        }
        if (decimal == 1){
            return "01";
        }
        if (decimal == 2){
            return "10";
        }
        if (decimal == 3){
            return "11";
        }
        return "you should not reach here";
    }
}