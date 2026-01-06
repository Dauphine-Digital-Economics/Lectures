// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

//Import statements

contract Empty{

}

contract Intro{
    /////////////////////////////////////////////
    // Value Type (Primitives) - fixed memory /// 
    // Fits in a cell or consecutive cells //////
    /////////////////////////////////////////////

    // Integers - uint8, uint16 to uint256
    function Integers() public pure returns(uint){
        // Integers come in different sizes and can be signed (positive and negative)
        // or unsigned (only positive), uints are preferred to save memory.

        uint8 a = 250;
        uint8 b = 250;
        uint c = uint(a)+uint(b);

        return c;
    }

    // The EVM can also interpret decimal numbers as binary when binary operators are applied to it
    // Binary operators: >>, <<, ~, &
    function shiftInt() external pure returns(uint){
        uint a = 8;
        return a << 2;
    }

    // Only bytes1 - bytes32 are considered primitives. They fit into a "cell".
     function PrimitiveBytes() public pure returns(bytes32){
        bytes32 a = "Hello!";
        return a[0];
    }

    // Booleans can be compared with logical operators (||, &&, ==, !)
    function BooleanOperators() public pure returns(bool){
        bool a = true;
        bool b = false;
        return a && b;
    }

    ///////////////////////////////////////////////////////
    // Dynamic Type (Reference) - varying memory length /// 
    // A pointer is stored at the root, with values     ///
    // stored elsewhere.                                ///
    ///////////////////////////////////////////////////////
    
    // Arrays can be fixed or dynamic
    // Dynamic arrays can be declared in storage
    uint[] public dynamicArray;
    function Arrays() public returns(uint[] memory){
        //Can also be declared in functions
        //uint[] memory dynamicArray2 = new uint[](3);
        // Arrays can also be fixed
        // Dynamic Arrays only have 4 functions
        // length - number of elements
        // pop - remove last element
        // push - add a new element to end of list
        // delete - delete the array (also applies to fixed arrays)
        dynamicArray.push(4);

        //When Solidity Instantiates variable with no value given, the deafult is ZERO
        return dynamicArray;
    }

    // Mappings can only be intialized as global storage variables
    // No iterable functions over mappings. Only key/value recall
    mapping (uint => uint) public map;
    function checkMap()public returns(uint) {
        map[1]=0;
        return map[1];
    }

    // Structs encompass several related values
    struct Hobby{
        uint8 YOE;
        bool Current;
    }

    struct Person{
        uint8 age;
        uint8 height; //tightly pack small variables together
        Hobby hobby;  // struct in a struct is nesting. HIghly expensive
    }
    function Structs(uint8 age, uint8 height, Hobby memory hobby) public pure returns(Person memory){
        Person memory new_friend = Person(age, height, hobby);
        return new_friend;
    }
}

contract DecimaltoBinary{
    // Dynamic arrays are expensive, 
    // a uint implies a possible 256 bit long binary, therefore set byte array to 256.
    function convert (uint decimal) public pure returns(string memory){
        bytes memory loop_result = new bytes(256);
        uint track = 0;
        while(decimal != 0){
            if(decimal%2 == 1){
                loop_result[track] = bytes1("1");
            } else {
                loop_result[track] = bytes1("0");
            }
            decimal = decimal/2;
            track++;
        }

        // Now we need to flip the final result
        bytes memory final_result = new bytes(track);
        for(uint i=0; i<track; i++){
            final_result[i] = loop_result[track-1-i];
        }
    return string(final_result);
    }
}