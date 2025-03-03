//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Christmas{	
    mapping(string => uint) private naughty_list;    
    string[] private names;   
    
    constructor (){        
        names = ["Annie", "Tim", "Mark"];        
        naughty_list["Annie"] = 0;        
        naughty_list["Tim"] = 0;        
        naughty_list["Mark"] = 0;    
    }    
    
    function get_score(string calldata name) external view returns(uint){        
        return naughty_list[name];    
    }	
    
    function increase_naughty_score(string calldata name) external {        
        bool not_in_list = true;
        bytes32 nameHash = keccak256(abi.encodePacked(name));

        for(uint i = 0; i < names.length; i++){            
            if (keccak256(abi.encodePacked(names[i]))== nameHash){
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