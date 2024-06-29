// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DataStorage {
    // The data location of x is storage.
    // This is the only place where the
    // data location can be omitted.
    uint[] public x = [1, 2, 3];

    // storage: The state variables are storage by default, which are stored on-chain.
    function fStorage() public {
        //声明一个storage的变量xStorage，指向x。修改xStorage也会影响x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    // memory: The parameters and temporary variables in the function generally use memory label,
    //which is stored in memory and not on-chain.
    function fMemory() public view {
        //声明一个Memory的变量xMemory，复制x。修改xMemory不会影响x
        uint[] memory xMemory = x;
        xMemory[0] = 100;
        xMemory[1] = 200;
        uint[] memory xMemory2 = x;
        xMemory2[0] = 300;
    }

    //calldata: Similar to memory, stored in memory, not on-chain.
    //The difference from memory is that calldata variables cannot be modified, and is generally used
    //for function parameters.
    function fCalldata(
        uint[] calldata _x
    ) public pure returns (uint[] calldata) {
        //参数为calldata数组，不能被修改
        //_x[0] = 0 //这样修改会报错
        return (_x);
    }
}

// Variable scope
// There are three types of variables in Solidity according to their scope:
// state variables, local variables, and global variables.

// 1. State variables:
contract Variables {
    uint public x = 1;
    uint public y;
    string public z;

    function foo() external {
        // You can change the value of the state variable in the function
        x = 5;
        y = 2;
        z = "0xAA";
    }

    // 2. Local variables:
    // Local variables are variables that are only valid during function execution;
    // they are invalid after function exit. The data of local variables are stored in memory,
    // not on-chain, and their gas consumption is low.

    // Local variables are declared inside a function:
    function bar() external pure returns (uint) {
        uint xx = 1;
        uint yy = 3;
        uint zz = xx + yy;
        return (zz);
    }

    // 3. Global variable:
    // Global variables are variables that work in the global scope and are reserved keywords for
    // solidity. They can be used directly in functions without declaring them:
    function global() external view returns (address, uint, bytes memory) {
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return (sender, blockNum, data);
    }
}
