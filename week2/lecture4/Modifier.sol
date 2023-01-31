// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "Inheritance.sol";

contract Lexus is Toyota{
    modifier checkYear(uint price, uint year){
        if (1000*year <= price){
            _;
        }
    }

    function depreciate(uint year, uint originalPrice) 
    external override checkYear(originalPrice, year) returns(uint){
        //Fictional depreciation of 1000 per year
        return originalPrice - 1000*year;
    }

    
    function fuelCost(uint distance) public returns(uint){
        return fuelPrice("unleaded") * fuelUsage(distance);
    }
}