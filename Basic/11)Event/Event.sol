// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Event
// Event is used to log the occurrence of an event in the blockchain.
contract Event {
    // 定义_balances映射变量，记录每个地址的持币数量
    mapping(address => uint256) public _balances;

    // 定义Transfer event，记录transfer交易的转账地址，接收地址和转账数量
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 定义_transfer函数，执行转账逻辑
    function _transfer(
        address from, //
        address to, //
        uint256 amount //
    ) external {
        _balances[from] = 10000000; // 给转账地址一些初始代币

        _balances[from] -= amount; // from地址减去转账数量
        _balances[to] += amount; // to地址加上转账数量

        // 释放事件
        emit Transfer(from, to, amount);
    }
}

//decoded input"
// {
// 	"address from": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 	"address to": "0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B",
// 	"uint256 amount": "1000"
// }

// Log out put:

// {
// 	"from": "0xf8e81D47203A594245E36C48e151709F0C19fBe8",
// 	"topic": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef",
// 	"event": "Transfer",
// 	"args": {
// 		"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 		"1": "0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B",
// 		"2": "1000",
// 		"from": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// 		"to": "0xa0343A6e8C6e26E834FfB6Ea1A0884d8AA6dc34B",
// 		"value": "1000"
// 	}
// }
