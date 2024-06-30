// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;

contract Call {
    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);

    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX()，同时可以发送ETH
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit Response(success, data); //释放事件
    }

    function callGetX(address _addr) external returns (uint256) {
        // call getX()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data); //释放事件
        return abi.decode(data, (uint256));
    }

    function callNonExist(address _addr) external {
        // call 不存在的函数
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit Response(success, data); //释放事件
    }
}



//Call contract的setX()函数接收一个uint256参数x，并将其保存到storage中。(0xb9ade348b6d06469c836f5e436089f8e2e2181e8)
// [
// 	{
// 		"from": "0x2ada7c3030fbdb74814466e0f471965f0530935c",
// 		"topic": "0x13848c3e38f8886f3f5d2ad9dff80d8092c2bbb8efd5b887a99c2c6cfc09ac2a",
// 		"event": "Response",
// 		"args": {
// 			"0": true,
// 			"1": "0x0000000000000000000000000000000000000000000000000000000000000001",
// 			"success": true,
// 			"data": "0x0000000000000000000000000000000000000000000000000000000000000001"
// 		}
// 	}
// ]