// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;
pragma experimental ABIEncoderV2;

contract DemoContract {
    // empty contract
}

//函数选择器
// 当我们调用智能合约时，本质上是向目标合约发送了一段calldata，在remix中发送一次交易后，
//可以在详细信息中看见input即为此次交易的calldata

contract Selector {
    // event 返回msg.data
    event Log(bytes data);
    event SelectorEvent(bytes4);

    // Struct User
    struct User {
        uint256 uid;
        bytes name;
    }

    // Enum School
    enum School {
        SCHOOL1,
        SCHOOL2,
        SCHOOL3
    }

    // 输入参数 to: 0x2c44b726ADF1963cA47Af88B284C06f30380fC78
    function mint(address /*to*/) external {
        emit Log(msg.data);
    }
    // 当参数为0x2c44b726ADF1963cA47Af88B284C06f30380fC78时，输出的calldata为
    // 0x6a6278420000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78

    // {
    // 	"from": "0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee",
    // 	"topic": "0xafabcf2dd47e06a477a89e49c03f8ebe8e0a7e94f775b25bbb24227c9d0110b2",
    // 	"event": "Log",
    // 	"args": {
    // 		"0": "0x6a6278420000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78",
    // 		"data": "0x6a6278420000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78"
    // 	}
    // }

    // 输出selector
    // "mint(address)"： 0x6a627842
    function mintSelector() external pure returns (bytes4 mSelector) {
        return bytes4(keccak256("mint(address)"));
    }
    //前4个字节为函数选择器selector：
    // 0x6a627842
    // 后面32个字节为输入的参数：
    // 0x0000000000000000000000002c44b726adf1963ca47af88b284c06f30380fc78

    // 无参数selector
    // 输入： 无
    // nonParamSelector() ： 0x03817936
    function nonParamSelector() external returns (bytes4 selectorWithNonParam) {
        emit SelectorEvent(this.nonParamSelector.selector);
        return bytes4(keccak256("nonParamSelector()"));
    }

    // elementary（基础）类型参数selector
    // 输入：param1: 1，param2: 0
    // elementaryParamSelector(uint256,bool) : 0x3ec37834
    function elementaryParamSelector(
        uint256 param1,
        bool param2
    ) external returns (bytes4 selectorWithElementaryParam) {
        emit SelectorEvent(this.elementaryParamSelector.selector);
        return bytes4(keccak256("elementaryParamSelector(uint256,bool)"));
    }

    // fixed size（固定长度）类型参数selector
    // 输入： param1: [1,2,3]
    // fixedSizeParamSelector(uint256[3]) : 0xead6b8bd
    function fixedSizeParamSelector(
        uint256[3] memory param1
    ) external returns (bytes4 selectorWithFixedSizeParam) {
        emit SelectorEvent(this.fixedSizeParamSelector.selector);
        return bytes4(keccak256("fixedSizeParamSelector(uint256[3])"));
    }

    // non-fixed size（可变长度）类型参数selector
    // 输入： param1: [1,2,3]， param2: "abc"
    // nonFixedSizeParamSelector(uint256[],string) : 0xf0ca01de
    function nonFixedSizeParamSelector(
        uint256[] memory param1,
        string memory param2
    ) external returns (bytes4 selectorWithNonFixedSizeParam) {
        emit SelectorEvent(this.nonFixedSizeParamSelector.selector);
        return bytes4(keccak256("nonFixedSizeParamSelector(uint256[],string)"));
    }

    // mapping（映射）类型参数selector
    // 输入：demo: 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99， user: [1, "0xa0b1"], count: [1,2,3], mySchool: 1
    // mappingParamSelector(address,(uint256,bytes),uint256[],uint8) : 0xe355b0ce
    function mappingParamSelector(
        DemoContract demo,
        User memory user,
        uint256[] memory count,
        School mySchool
    ) external returns (bytes4 selectorWithMappingParam) {
        emit SelectorEvent(this.mappingParamSelector.selector);
        return
            bytes4(
                keccak256(
                    "mappingParamSelector(address,(uint256,bytes),uint256[],uint8)"
                )
            );
    }
}
