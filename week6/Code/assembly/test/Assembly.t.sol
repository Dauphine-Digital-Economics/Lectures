// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {Assembly} from "../src/Assembly.sol";

contract AssemblyTest is Test {
    Assembly public asm;

    function setUp() public {
        asm = new Assembly();
    }

    function test_solidity_add() external view {
        assertEq(asm.add(1,1), 2);
    }

    function test_assembly_add() external view {
        assertEq(asm.arraySum(), 15);
    }

    function test_solidity_array() external view {
        assertEq(asm.add(1,1), 2);
    }

    function test_assembly_array() external view {
        assertEq(asm.arraySumWithAssembly(), 15);
    }
}
