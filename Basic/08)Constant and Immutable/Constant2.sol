// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Constant2 {
    uint256 public immutable IMMUTABLE_NUM;
    // immutable变量可以在constructor里初始化，之后不能改变
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    constructor(uint256 _immutableNum) {
        IMMUTABLE_NUM = _immutableNum;
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_TEST = test();
        IMMUTABLE_BLOCK = block.number;
    }

    function test() public pure returns (uint256) {
        uint256 what = 9;
        return (what);
    }
}
