// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 
import "../contracts/blockchain.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract BlockchainTest is Blockchain{

    constructor() Blockchain("Hello World"){}

    function checkGenesis() public {  
        Assert.equal(blockchain[0].prevHash, bytes32(0), "Genesis block correctly deploy");
    }

    function checkBlockBuilding() public{
    Block memory new_block = build_block("Next");
    Assert.equal(blockchain[0].hash, new_block.prevHash, "Unlinked blocks");
    }
}
    