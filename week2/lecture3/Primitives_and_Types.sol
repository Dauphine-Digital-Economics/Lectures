// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Primitives_and_Types {
    
    // Instantiate all Primitives and Types
    uint8 zero = 0;
    uint8 one = 1;
    uint8 two = 2;
    uint8 three = 3;

    string binary0 = "00";
    string binary1 = '01';
    string binary2 = "10";
    string binary3 = '11';

    mapping(string => uint8) binaryToDecimalMap;
    
    string[] decimalToBinary= ['00','01','10','11'];

    // Put the binary and decimal values into the mapping and struct
    constructor(){
        binaryToDecimalMap[binary0] = zero;
        binaryToDecimalMap[binary1] = one;
        binaryToDecimalMap[binary2] = two;
        binaryToDecimalMap[binary3] = three;
    }

    function binaryToDecimal(string memory binary) public view returns(uint8){
        return binaryToDecimalMap[binary];
    }

    function _decimalToBinary(uint8 decimal) public view returns(string memory){
        return decimalToBinary[decimal];
    }
}