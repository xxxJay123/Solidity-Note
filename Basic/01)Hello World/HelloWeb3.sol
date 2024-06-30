// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/* ParserError: Source file requires different compiler version (current compiler is 0.7.4+commit.3f05b770.Emscripten.clang) - note that nightly builds are considered to be strictly less than the released version
pragma solidity ^0.8.25;
^----------------------^ 
If there are hv this error, you need to use pragma solidity >=0.4.22 <0.9.0;
*/

contract HelloWeb3 {
    // If u learned about java, contract is similar to class in java
    string public _string = "Hello Web3!";
}

contract Boolean {
    // Boolean
    bool public _bool = true;
    // Boolean operators
    bool public _bool1 = !_bool; // logical NOT
    bool public _bool2 = _bool && _bool1; // logical AND
    bool public _bool3 = _bool || _bool1; // logical OR
    bool public _bool4 = _bool == _bool1; // equality
    bool public _bool5 = _bool != _bool1; // inequality
}

contract Integers {
    // Integer
    int public _int = -1; // integers including negative numbers
    uint public _uint = 1; // non-negative numbers
    uint256 public _number = 20220330; // 256-bit positive integers
    // Integer operations
    uint256 public _number1 = _number + 1; // +, -, *, /
    uint256 public _number2 = 2 ** 2; // Exponent
    uint256 public _number3 = 7 % 2; // Modulo (Modulus)
    bool public _numberbool = _number2 > _number3; // Great than
}

contract Byte {
    //Byte arrays in Solidity come in two types:
    // Fixed-length byte arrays:
    //////////////////////////// belong to value types, including byte, bytes8, bytes32, etc, depending on the size of each element (maximum 32 bytes). The length of the array can not be modified after declaration.
    //Variable-length byte arrays:
    ////////////////////////////belong to reference type, including bytes, etc. The length of the array can be modified after declaration. We will learn more detail in later chapters.

    // Fixed-size byte arrays
    bytes32 public _byte32 = "MiniSolidity";
    bytes1 public _byte = _byte32[0];
}

contract Eunm {
    // Enums in Solidity are used to define a set of named values.
    // Let uint 0,  1,  2 represent Buy, Hold, Sell
    enum ActionSet {
        Buy, //
        Hold, //
        Sell //
    }
    // Create an enum variable called action
    ActionSet action = ActionSet.Buy;

    // Enum can be converted into uint
    function enumToUint() external view returns (uint) {
        return uint(action);
    }

    // Enum can be converted into string
    function enumToString() external view returns (string memory) {
        return string(abi.encodePacked(action));
    }
}

contract Addresses {
    // Addresses have following 2 types:
    // address: Holds a 20 byte value (size of an Ethereum address).
    // address payable: Same as address, but with the additional members transfer and send to allow ETH transfers.

    // Address
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _address1 = payable(_address); // payable address (can transfer fund and check balance)
    // Members of address
    uint256 public balance = _address1.balance; // balance of address
}
