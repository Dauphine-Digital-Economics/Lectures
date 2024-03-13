// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Test, console2} from "forge-std/Test.sol";

contract GasTest is Test {


    function test_Plus() public view{
        // Must predefine the gas variables to remove hidden n variable initialization costs
        uint gas = 1;
        uint gas2 = 1;

        // Check gas before and after operation
        gas = gasleft();
        
        assembly{
            let a := add(1,1)
        }
        //uint a = 1+1;
        gas2 = gasleft();
        console2.logUint(gas - gas2);
    }

    function test_Yul() public pure{
        uint8[5] memory array = [0,1,2,3,4];
        uint sum = 0;
        assembly{
            for{let i:=0x80} lt(i, 0x160) {i := add (i,0x20)}{
                sum := add(sum, mload(i))
            }
        }
        console2.log("The total sum of the elements in the array is: %d", sum);
    }

    function test_Solidity() public pure {
        uint8[5] memory array = [0,1,2,3,4];
        uint sum = 0;
        for(uint i = 0; i < 5; i++){
            sum = sum + array[i];
        }
        console2.log("The total sum of the elements in the array is: %d", sum);
    }
}
