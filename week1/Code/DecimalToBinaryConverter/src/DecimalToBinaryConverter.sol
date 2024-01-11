//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

contract DecimalToBinaryConverter {
    

    function decimalInput(uint userInput) public pure returns(string memory){
        //instantiate needed variables
        uint quotient;
        uint remainder;   
        uint[256] memory result;
        uint i = 0;

        //loop through until last bit
        while(userInput/2 != 0){
            quotient = userInput / 2;
            remainder = userInput % 2;
            result[i] = remainder;
            userInput = quotient;
            i++;
        }
        //add the last bit
        remainder = userInput % 2;
        result[i] = remainder;

        // change into a string and flip bits
        bytes memory toString = new bytes(i+1);
        for (uint count = 0; count < i+1; count++){
            if (result[i-count] == 1){
                toString[count] = "1";
            } else {
                toString[count] = "0";
            }  
        }

        return string(toString);
    }
}