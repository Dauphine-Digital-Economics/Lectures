// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Consensus{
    address[] public current_validator_nodes;
    uint public quorum;

        function add_peer(address peer) public{
        current_validator_nodes.push(peer);
        quorum++;
    }

    
}