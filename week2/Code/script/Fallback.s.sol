// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../src/Fallback.sol";

contract FallbackScript is Script {
    TakeMyMoney public money;
    Fallback public fall;

    function setUp() public {
        money = new TakeMyMoney();
        fall = new Fallback();
    }

    function run() public {

        // Send TakeMyMoney 10Wei from any Anvil account - 10k ETH provided
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

        console2.log(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266.balance);
        payable(money).transfer(10);
        // TakeMyMoney sends to Fallback contract
        money.transferMoney(address(fall), 9);

        // check if flag was raised
        console2.logBool(fall.getFallbackState());
        console2.log(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266.balance);
        
    }
}
