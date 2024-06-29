// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ArrayTypes {
    // fixed-length array
    uint[8] array1;
    bytes[5] array2;
    address[100] array3;

    // variable-length array
    uint[] array4;
    bytes[] array5;
    address[] array6;
    bytes array7;

    // memory dynamic array
    // 初始化可变长度 Array
    uint[] array8 = new uint[](5);
    bytes[] array9 = new bytes[](9);

    function initArray() external pure returns (uint[] memory) {
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return (x);
    }

    function arrayPush() public returns (uint[] memory) {
        uint[4] memory a = [uint(1), 2, 4, 8];
        array4 = a;
        array4.push(9);
        return array4;
    }
}
