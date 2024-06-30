// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Fallback {
    // 触发fallback() 还是 receive()?
    //            接收ETH
    //               |
    //          msg.data是空？
    //             /  \
    //           是    否
    //           /      \
    // receive()存在?   fallback()
    //         / \
    //        是  否
    //       /     \
    // receive()  fallback

    // Step 1: 定义事件
    event receivedCalled(address Sender, uint amount);
    event fallbackCalled(address Sender, uint amount, bytes data);

    // 接收ETH时释放Received事件
    receive() external payable {
        emit receivedCalled(msg.sender, msg.value);
    }

    // fallback函数
    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}

// "VALUE" 栏中填入要发送给合约的金额（单位是 Wei），然后点击 "Transact"。
//可以看到交易成功，并且触发了 "receivedCalled" 事件。
// [
// 	{
// 		"from": "0x7b96aF9Bd211cBf6BA5b0dd53aa61Dc5806b6AcE",
// 		"topic": "0x24feae88ede5c2d07f0ca617a259e25baf86481eafba06bc78af89772bc0b6b7",
// 		"event": "receivedCalled",
// 		"args": {
// 			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 			"1": "1000",
// 			"Sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 			"amount": "1000"
// 		}
// 	}
// ]

// " VALUE" 栏中填入要发送给合约的金额（单位是 Wei），"CALLDATA" 栏中填入随意编写的msg.data，然后点击 "Transact"。
// 可以看到交易成功，并且触发了 "fallbackCalled" 事件。
// [
// 	{
// 		"from": "0x7b96aF9Bd211cBf6BA5b0dd53aa61Dc5806b6AcE",
// 		"topic": "0x7bf8121d238f1338d4842c396807cbe93f5a2396e2b3cad1639735997867b1f5",
// 		"event": "fallbackCalled",
// 		"args": {
// 			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 			"1": "0",
// 			"2": "0xabcd",
// 			"Sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 			"amount": "0",
// 			"data": "0xabcd"
// 		}
// 	}
// ]
