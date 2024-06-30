// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Control Flow
contract ControlFlow {
    //Solidity's control flow is similar to other languages, mainly including the following components:

    //1. If-else statements
    function ifElseTest(uint256 _number) public pure returns (bool) {
        if (_number == 0) {
            return (true);
        } else {
            return (false);
        }
    }

    //2. for Loops
    function forLoopTest() public pure returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < 10; i++) {
            sum += i;
        }
        return (sum);
    }

    // 3. while Loops
    function whileTest() public pure returns (uint256) {
        uint sum = 0;
        uint i = 0;
        while (i < 10) {
            sum += i;
            i++;
        }
        return (sum);
    }

    //4. do-while Loops
    function doWhileTest() public pure returns (uint256) {
        uint sum = 0;
        uint i = 0;
        do {
            sum += i;
            i++;
        } while (i < 10);
        return (sum);
    }

    //5. switch-case statements
    function switchCaseTest(
        uint256 _number
    ) public pure returns (string memory) {
        string memory result;
        if (_number == 0) {
            result = "zero";
        } else if (_number == 1) {
            result = "one";
        } else if (_number == 2) {
            result = "two";
        } else {
            result = "unknown";
        }
        return (result);
    }

    // ternary/conditional operator 三元运算符 
    function ternaryTest(uint256 x, uint256 y) public pure returns (uint256) {
        // return the max of x and y
        return x >= y ? x : y;
    }
}
