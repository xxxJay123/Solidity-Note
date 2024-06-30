// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;

//哈希函数（hash function）是一个密码学概念，它可以将任意长度的消息转换为一个固定长度的值，
// 这个值也称作哈希（hash）。这一讲，我们简单介绍一下哈希函数及在Solidity的应用。

//Hash的性质
//一个好的哈希函数应该具有以下几个特性：
//1. 单向性：给定一个消息，它应该有唯一的输出值。
//2. 灵敏性：输入的消息改变一点对它的哈希改变很大。
//3. 高效性：从输入的消息到哈希的运算高效。
//4. 均匀性：对于任意输入，它应该产生均匀分布的输出值。
// 5.抗碰撞性：
// //////弱抗碰撞性：给定一个消息x，找到另一个消息x'，使得hash(x) = hash(x')是困难的。
// //////强抗碰撞性：找到任意x和x'，使得hash(x) = hash(x')是困难的。

//Hash的应用
// 生成数据唯一标识
// 加密签名
// 安全加密

contract Hash {
    //Keccak256
    bytes32 public _msg = keccak256(abi.encodePacked("0xJ123"));
    bytes32 public _temp;

    // 唯一数字标识
    function hash(
        uint _num,
        string memory _string,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }

    // 弱抗碰撞性
    function weak(string memory string1) public returns (bool) {
        return (_temp = keccak256(abi.encodePacked(string1))) == _msg;
    }

    // 强抗碰撞性
    function strong(
        string memory string1,
        string memory string2
    ) public pure returns (bool) {
        return
            keccak256(abi.encodePacked(string1)) ==
            keccak256(abi.encodePacked(string2));
    }
}
