// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Constant和 Immutable
contract Constant {
    // constant变量必须在声明的时候初始化，之后不能改变
    // It is similer to java static variable

    // constant变量必须在声明的时候初始化，之后不能改变
    uint256 public constant CONSTANT_NUM = 10;
    string public constant CONSTANT_STRING = "0xAA";
    bytes public constant CONSTANT_BYTES = "WTF";
    address public constant CONSTANT_ADDRESS =
        0x0000000000000000000000000000000000000000;

    // immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable IMMUTABLE_NUM = 9999999999;
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    // 利用constructor初始化immutable变量，因此可以利用
    constructor() {
        IMMUTABLE_ADDRESS = address(this);

        //IMMUTABLE_NUM = 1118;
        IMMUTABLE_TEST = test();

        // immutable 變量需要在構造函數中初始化,否則編譯器會報錯。
        IMMUTABLE_BLOCK = block.number;
    }

    function test() public pure returns (uint256) {
        uint256 what = 9;
        return (what);
    }
}

//根據 Solidity 的規定,immutable 變量只能被初始化一次,這通常是在構造函數中完成的。如果你試圖在構造函數中再次修改 IMMUTABLE_NUM 的值,編譯器就會報錯。

//要解決這個問題,你可以移除重複初始化 IMMUTABLE_NUM 的那一行代碼:
// constructor() {
//     IMMUTABLE_ADDRESS = address(this);
//     IMMUTABLE_TEST = test();
//     IMMUTABLE_BLOCK = block.number;
// }

//另外,如果你想在部署時動態地設置 IMMUTABLE_NUM 的值,可以考慮使用 constructor 參數來實現,像這樣:
// contract Constant {
//     uint256 public immutable IMMUTABLE_NUM;

//     constructor(uint256 _immutableNum) {
//         IMMUTABLE_NUM = _immutableNum;
//         IMMUTABLE_ADDRESS = address(this);
//         IMMUTABLE_TEST = test();
//         IMMUTABLE_BLOCK = block.number;
//     }

//     // ...
// }
