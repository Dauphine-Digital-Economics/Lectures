//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract christmas{
	mapping(string => uint) private naughty_list;
    string[] private names;

    constructor (){
        names = ["Annie", "Tim", "Mark"];
        naughty_list["Annie"] = 0;
        naughty_list["Tim"] = 0;
        naughty_list["Mark"] = 0;
    }

    function get_score(string memory name) external view returns(uint){
        return naughty_list[name];
    }

	function increase_naughty_score(string memory name) public {
        bool not_in_list = true;

        for(uint i = 0; i < names.length; i++){
            if (keccak256(abi.encodePacked(names[i]))== keccak256(abi.encodePacked(name))){
                not_in_list = false;
                naughty_list[names[i]] += 10;
            }
        }

        if (not_in_list){
            names.push(name);
            naughty_list[name] = 10;
        }
    }
}