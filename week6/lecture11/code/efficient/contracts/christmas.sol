//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract christmas{
	mapping(address => uint) private naughty_list;

    function get_score(address user) external view returns(uint){
        return naughty_list[user];
    }

	function increase_naughty_score(address user) external {
        naughty_list[user] += 10;
    }
}