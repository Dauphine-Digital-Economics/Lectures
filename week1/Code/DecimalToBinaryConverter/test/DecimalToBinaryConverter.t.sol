// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {DecimalToBinaryConverter} from "../src/DecimalToBinaryConverter.sol";

contract CounterTest is Test {
    DecimalToBinaryConverter public converter;

    function setUp() public {
        converter = new DecimalToBinaryConverter();
    }

    function test_Equal() public {
        assertEq(converter.decimalInput(13), "1101");
    }
}
