// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;

// 合约中创建新合约 just like the oop concept in programming
contract Pair {
    address public factory; // 合约地址
    address public token0; // 第一个代币地址
    address public token1; // 第二个代币地址

    constructor() payable {
        factory = msg.sender; // 合约创建者地址
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "Only factory can initialize");
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
    address[] public allPairs; // // 保存所有Pair地址

    function createPair(
        address tokenA,
        address tokenB
    ) external returns (address pairAddy) {
        // 创建新合约
        Pair pair1 = new Pair();
        // 调用新合约的initialize方法
        pair1.initialize(tokenA, tokenB);
        // 更新地址map
        pairAddy = address(pair1);
        allPairs.push(pairAddy);
        getPair[tokenA][tokenB] = pairAddy;
        getPair[tokenB][tokenA] = pairAddy;
    }
}
