// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// 通过网址引用
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

// 通过npm的目录导入
import "@openzeppelin/contracts/access/Ownable.sol";

// 通过指定全局符号导入合约特定的全局符号
import {Yeye} from "./Yeye.sol";

contract Import {
    // 成功导入Address库
    using Address for address;
    // 声明yeye变量
    Yeye yeye = new Yeye();

    // 测试是否能调用yeye的函数
    function test() external {
        yeye.hip();
    }
}

// 编译后合约的abi文件中会包含以下内容：
// [
// 	{
// 		"from": "0x4b0d7A551c9371AEfC004Ae1a9F184aCD39B89C6",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "Yeye",
// 			"msg": "Yeye"
// 		}
// 	}
// ]
