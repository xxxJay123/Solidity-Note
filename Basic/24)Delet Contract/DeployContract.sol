// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;
pragma experimental ABIEncoderV2;

// 导入DeleteContract合约
import "./DeleteContract.sol";

// 部署新合约的主合约
contract DeployContract {
    // 定义一个结构体DemoResult来存储结果
    struct DemoResult {
        address addy; // 合约地址
        uint balance; // 合约余额
        uint value; // 合约的某个值
    }

    // 合约的构造函数，可以接受以太币
    constructor() payable {}

    // 获取当前合约的余额
    function getBalance() external view returns (uint balance) {
        balance = address(this).balance;
    }

    // 演示函数，创建并删除一个合约，并返回相关信息
    function demo() public payable returns (DemoResult memory) {
        // 创建一个新的DeleteContract合约实例
        DeleteContract deleteContract = new DeleteContract();

        // 检查deleteContract合约是否存在`getBalance`和`value`方法
        try deleteContract.getBalance() returns (uint deleteContractBalance) {
            try deleteContract.value() returns (uint deleteContractValue) {
                // 创建一个DemoResult结构体实例来存储结果
                DemoResult memory res = DemoResult({
                    addy: address(deleteContract),
                    balance: deleteContractBalance,
                    value: deleteContractValue
                });

                // 调用deleteContract合约的deleteContract方法以销毁合约
                deleteContract.deleteContract();

                // 返回结果
                return res;
            } catch {
                revert("Failed to call value() on DeleteContract");
            }
        } catch {
            revert("Failed to call getBalance() on DeleteContract");
        }
    }
}
