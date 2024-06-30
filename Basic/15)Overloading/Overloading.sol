// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Overloading
contract Overloading {
    // 定义具有相同函数名称但参数不同的多个函数。参数的数量、类型或顺序必须有所不同。
    // 当调用该函数时,Solidity 编译器会根据传入的参数自动选择合适的函数版本执行。
    function add(uint x, uint y) public pure returns (uint) {
        return x + y;
    }

    function add(uint x, uint y, uint z) public pure returns (uint) {
        return x + y + z;
    }

    function saySomething() public pure returns (string memory) {
        return ("Nothing");
    }

    function saySomething(
        string memory something
    ) public pure returns (string memory) {
        return (something);
    }

    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
}
