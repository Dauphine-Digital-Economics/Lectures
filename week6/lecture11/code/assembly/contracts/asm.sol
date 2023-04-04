//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract asm{
	uint[5] private fixed_array;
	uint[] private dynamic_array;
	mapping(uint => uint) map;

	constructor(){
		fixed_array = [1,2,3,4,5];
		dynamic_array.push(1);
		dynamic_array.push(2);
		dynamic_array.push(3);
		dynamic_array.push(4);
		dynamic_array.push(5);
		map[1] = 1;
		map[2] = 2;
		map[3] = 3;
	}	

	function get_fixed_element(uint index) external view returns(uint){
		uint answer;
		uint array_slot; //cast to int otherwise Yul tried to use hex
		assembly{
			array_slot := fixed_array.slot
			answer := sload(add(array_slot, index)) //load value after adding slots
		}
		return answer;
	}

	function get_dynamic_element(uint index) external view returns(uint){
		uint ans;
		uint slot;

		assembly{
			slot := dynamic_array.slot
		}

		bytes32 startIndex = keccak256(abi.encode(slot)); // data storage starts at the keccak hash and is continuous

		assembly{
			let length := sload(slot) // the length s stored in the location of the slot
			ans := sload( add(startIndex, index)) //add the index like a fixed array
		}

		return ans;
	}

	function get_map_element(uint key) external view returns(uint){
		uint ans;
		uint slot;

		assembly{
			slot := map.slot //mappings store 0s inside the slot location
		}
		//same as dynamic array except keccak hash the key
		// Important: must put key first!!
		bytes32 keyIndex = keccak256(abi.encode(key, slot));
		
		assembly{
			ans := sload(keyIndex)
		}
		return ans;
	}

	// This function will create a fixed array of length 5 with values 1 - 5 and return the value at index
	function memory_array(uint index) external pure returns(uint answer){
		require(index < 5);
		assembly{
			//Always remember, the free memory pointer lives at location 0x40!!
			let array_pt := mload(0x40)
			let x := 1
			for {let i := 0} lt(i, 5) {i := add(i,1)}{
				mstore(array_pt, x)
				x := add(x,1)
				array_pt := add(array_pt, 0x20)
			}
			//Note, there is a return in Yul, it is NOT the same as a Solidity return! We will not be using it
			answer := mload(add(mload(0x40), mul(index,0x20)))

			//Finally, update the value inside the free memory pointer
			mstore(0x40, array_pt)
		}
		return answer;
	}
}