// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract InitialValue {
    // Value Types
    bool public _bool; // false
    string public _string; // ""
    int public _int; // 0
    uint public _uint; // 0
    address public _address; // 0x0000000000000000000000000000000000000000

    enum ActionSet {
        Buy, //
        Hold, //
        Sell //
    }
    ActionSet public _enum; // first element 0

    function fi() internal {} // internal blank function
    function fe() external {} // external blank function

    // Reference Types
    uint[8] public _staticArray; // 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
    uint[] public _dynamicArray; // `[]`
    mapping(uint => address) public _mapping; // 所有元素都为其默认值的mapping

    // 所有成员设为其默认值的结构体 0, 0
    struct Student {
        uint256 id;
        uint256 score;
    }
    Student public student;

    // delete操作符
    bool public _bool2 = true;
    function d() external {
        delete _bool2; // delete 会让_bool2变为默认值，false
    }
}
