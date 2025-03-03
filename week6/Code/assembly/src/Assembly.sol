// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Assembly{
    function add(uint a, uint b) external pure returns (uint256) {
        return a + b;
    }

    function addWithAssembly(uint a, uint b) external pure returns (uint) {
        assembly {
            let result := add(a, b)
            mstore(0x80, result)
            return(0x80, 32)
        }
    }

    function arraySum() external pure returns(uint){
        uint8[5] memory fixedArray = [1,2,3,4,5];
        uint result = 0;
        for (uint i; i< 5 ; i++){
            result = result + fixedArray[i];
        }
        return result;
    }

    function arraySumWithAssembly() external pure returns(uint){
        uint8[5] memory fixedArray = [1,2,3,4,5];
        assembly{
            let result := 0
            for{let i := fixedArray} lt(i,0x120) {i:= add(i, 0x20)}{
                result := add(result, mload(i))
            }
            mstore(0x500, result)
            return (0x500,32)
        }
    }
}