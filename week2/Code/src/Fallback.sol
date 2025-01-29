// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract Fallback {
    bool private flag = false;

    fallback() external payable{
        flag = true;
    }

    function getFallbackState() external view returns(bool){
        return flag;
    }
}

contract TakeMyMoney{
    function transferMoney(address to, uint amount)public returns(bool){
        require(address(this).balance >= amount);
        (bool success, )=to.call{value: amount}("");
        return success;
    }

    receive() external payable{}
}
