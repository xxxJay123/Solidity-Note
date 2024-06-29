// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Mapping {
    mapping(uint => address) public idToAddress; // id映射到地址
    mapping(address => address) public swapPair; // 币对的映射，地址到地址

    // 规则1. _KeyType不能是自定义的 下面这个例子会报错
    // 我们定义一个结构体 Struct
    // struct Student{
    //    uint256 id;
    //    uint256 score;
    //}
    // mapping(Struct => uint) public testVar;

    function writeMap(uint _Key, address _Value) public {
        idToAddress[_Key] = _Value; // _Key: "1" , _Value: "0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B"
    }
    // Deployed Contract Output is:
    //{
    //"uint256 _Key": "1",
    //"address _Value": "0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B"
    //}
}
