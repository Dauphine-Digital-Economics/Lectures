// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

import "remix_tests.sol"; 
import "../contracts/node.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract NodeIntegrationTest {
    // First deploy everything in the correct order
    Node public first = Node(0xd9145CCE52D386f254917e481eB44e9943F39138);
    Node public second = Node(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    Node public third = Node(0xf8e81D47203A594245E36C48e151709F0C19fBe8);
    Node public fourth = Node(0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B);


    function checkInitialization() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
        (bytes32 hash1,,,) = first.blockchain(0);
        Assert.greaterThan(uint(hash1), uint(0), "Genesis block not created");
        (bytes32 hash2,,,) = first.blockchain(0);
        Assert.greaterThan(uint(hash2), uint(0), "Genesis block not created");
        (bytes32 hash3,,,) = first.blockchain(0);
        Assert.greaterThan(uint(hash3), uint(0), "Genesis block not created");
    }

    function checkPeers() public {
        Assert.equal(first.validatorCount(), uint(3), "Peers not correctly added1");
        Assert.equal(second.validatorCount(), uint(3), "Peers not correctly added2");
        Assert.equal(third.validatorCount(), uint(3), "Peers not correctly added3");
        Assert.equal(fourth.validatorCount(), uint(3), "Peers not correctly added4");
    }

    // Check peer list correctness
    function checkInput() public {
        // Use the return value (true or false) to test the contract
        first.user_input("Next Block");
        Assert.equal(first.current_message(), "Next Block", "Incorrect user input");
    }
    
    function checkPropagateAndFinalize() public returns(bool){
        first.user_input("Next Block");
        Assert.equal(first.current_message(), "Next Block", "Incorrect user input");
        first.propose_block();
        Assert.equal(first.current_block_quorum(), uint(3), "Did not reach quorum");
        first.check_block_finality_and_build();
        return true;
    }
}