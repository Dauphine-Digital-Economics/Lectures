//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ChristmasCheap{	
    mapping(address => uint) private naughty_list;    
    
    constructor (){       
        naughty_list[address(1)] = 0;        
        naughty_list[address(2)] = 0;        
        naughty_list[address(3)] = 0;    
    }    
    
    function get_score(address user) external view returns(uint){        
        return naughty_list[user];    
    }	
    
    function increase_naughty_score(address user) external {        
    //Here, we do not need to check if the string name exists because 
    // Solidity will automatically add the entry if it does not exist.  
    naughty_list[user] += 10;            
    }
}