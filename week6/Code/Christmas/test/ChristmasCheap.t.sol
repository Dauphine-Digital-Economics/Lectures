// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ChristmasCheap} from "src/ChristmasCheap.sol";

contract ChristmasCheapTest is Test {
    ChristmasCheap public xmas_cheap;

    function setUp() public {
        xmas_cheap = new ChristmasCheap();
    }

    function test_IncreaseNaughtyScore() public {
        xmas_cheap.increase_naughty_score(address(1));
        assertEq(xmas_cheap.get_score(address(1)), 10);
        xmas_cheap.increase_naughty_score(address(10));
        assertEq(xmas_cheap.get_score(address(10)), 10);
    }
}
