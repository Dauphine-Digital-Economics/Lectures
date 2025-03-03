// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Christmas} from "../src/Christmas.sol";

contract ChristmasTest is Test {
    Christmas public xmas;

    function setUp() public {
        xmas = new Christmas();
    }

    function test_IncreaseNaughtyScore() public {
        xmas.increase_naughty_score("Annie");
        assertEq(xmas.get_score("Annie"), 10);
    }
}
