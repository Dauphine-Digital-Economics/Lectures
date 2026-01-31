// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Blockchain{
    struct Block{
        bytes32 hash;
        bytes32 prevHash;
        uint blockNum;
        string message;
    }

    Block[] public blockchain;

    uint public next_block_num;

    // The first block of any blockchain is called the gensis block
    constructor(string memory secret_first_phrase){
        Block memory genesis = Block({
            hash: hashFunc(secret_first_phrase),
            prevHash: "",
            blockNum: 0,
            message: secret_first_phrase
        });
        next_block_num = 1;
        blockchain.push(genesis);
    }

    // Hash the message together
    function hashFunc(string memory data) private pure returns(bytes32){
        return keccak256(abi.encodePacked(data));
    }

    function build_block(string memory message) public view returns(Block memory){
        //fetch the current block
        Block memory current_block = blockchain[next_block_num-1];
        Block memory new_block = Block({
            hash: hashFunc(message),
            prevHash: current_block.hash,
            blockNum: next_block_num,
            message: message
        });

        return new_block;
    }
    // 1 for approved, 0 for fail
    function check_block(Block memory proposed_block) public view returns(uint){
        //Get the current block
        Block memory current_block = blockchain[next_block_num-1];

        // Conditions can be enforced in Solidity using require or revert statements
        // Check that the block numbers are consequential
        // Check the hash and previous hash are correctly linked
        if(proposed_block.blockNum - current_block.blockNum != 1){
            return 0;
        }
        if(proposed_block.prevHash != current_block.hash){
            return 0;
        }

        return 1;
    }
}
