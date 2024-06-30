// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;
pragma experimental ABIEncoderV2;

contract ABIEncode {
    uint x = 10;
    address addy = 0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B;
    string name = "0xJ123";
    string btcAddy = "xxxJay123.btc";
    uint[2] array = [5, 6];

    //1. abi.encode
    // 将给定参数利用ABI规则编码。ABI被设计出来跟智能合约交互，他将每个参数填充为32字节的数据，
    // 并拼接在一起。如果你要和合约交互，你要用的就是abi.encode。
    function encode() public view returns (bytes memory result) {
        result = abi.encode(x, addy, name, array);
    }

    //2. abi.encodePacked
    // 将给定参数根据其所需最低空间编码。它类似 abi.encode，但是会把其中填充的很多0省略。
    // 只用1字节来编码uint8类型。当你想省空间，并且不与合约交互的时候，可以使用abi.encodePacked，
    // 例如算一些数据的hash时。
    function encodePacked() public view returns (bytes memory result) {
        result = abi.encodePacked(x, addy, name, array);
    }

    //3. abi.encodeWithSignature
    //与abi.encode功能类似，只不过第一个参数为函数签名，比如"foo(uint256,address,string,uint256[2])"。
    // 当调用其他合约的时候可以使用。
    function encodeWithSignature() public view returns (bytes memory result) {
        result = abi.encodeWithSignature(
            "foo(uint256,address,string,uint256[2])",
            x,
            addy,
            name,
            array
        );
    }

    // 4.abi.encodeWithSelector
    //与abi.encodeWithSignature功能类似，只不过第一个参数为函数选择器，为函数签名Keccak哈希的前4个字节。
    function encodeWithSelector() public view returns (bytes memory result) {
        result = abi.encodeWithSelector(
            bytes4(keccak256("foo(uint256,address,string,uint256[2])")),
            x,
            addy,
            name,
            array
        );
    }

    //5.  abi.decode
    //abi.decode用于解码abi.encode生成的二进制编码，将它还原成原本的参数。
    function decode(
        bytes memory data
    )
        public
        pure
        returns (
            uint dx,
            address daddr,
            string memory dname,
            uint[2] memory darray
        )
    {
        (dx, daddr, dname, darray) = abi.decode(
            data,
            (uint, address, string, uint[2])
        );
    }
}
