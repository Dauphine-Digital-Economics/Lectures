// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface Car{
    function depreciate(uint year, uint originalPrice) external returns(uint);
    function fuelUsage(uint distance) external returns(uint);
}

contract Petrol {
    function fuelPrice(string memory fuelType) internal pure returns(uint){
        if(keccak256(abi.encodePacked(fuelType))==keccak256(abi.encodePacked("diesel"))){
            return 2;
        }

        if(keccak256(abi.encodePacked(fuelType))==keccak256(abi.encodePacked("unleaded"))){
            return 3;
        }
        return 1;
    }
}

contract Tesla is Car{
    uint lifeSpan = 30;

    function depreciate(uint year, uint originalPrice) external view returns(uint){
        uint endValue = originalPrice/4;
        // Linear depreciatation
        uint perYear = (originalPrice - endValue) / lifeSpan;
        return originalPrice - perYear*year;
    }

    function fuelUsage(uint distance) external pure returns(uint){
        return 0 * distance;
    }

}

contract Toyota is Car, Petrol{
    function depreciate(uint year, uint originalPrice) external returns(uint){
        //Fictional depreciation of 1000 pe year
        return originalPrice - 1000*year;
    }

    function fuelUsage(uint distance) public pure returns(uint){
        return distance * 2; //2L per km
    }
}