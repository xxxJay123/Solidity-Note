// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;

contract TestContract {
    // contract address: 0xb9ade348b6d06469c836f5e436089f8e2e2181e8
    uint256 private _x = 0; // 状态变量_x
    // 收到eth的事件，记录amount和gas
    event Log(uint amount, uint gas);

    // 返回合约ETH余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable {
        _x = x;
        // 如果转入ETH，则释放Log事件
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    // 读取_x
    function getX() external view returns (uint x) {
        x = _x;
    }
}

contract CallContract {
    function callSetX(address _Address, uint256 x) external {
        TestContract(_Address).setX(x);
    }

    function callGetX(TestContract _Address) external view returns (uint x) {
        x = _Address.getX();
    }

    function callGetX2(address _Address) external view returns (uint x) {
        TestContract oc = TestContract(_Address);
        x = oc.getX();
    }

    function setXTransferETH(address testContract, uint256 x) external payable {
        TestContract(testContract).setX{value: msg.value}(x);
    }
}
