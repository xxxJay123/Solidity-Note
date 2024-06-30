// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//```
//    function <function name>(<parameter types>) [internal|external] [pure|view|payable] [returns (<return types>)]
//````

//pure v.s. view:
contract Function {
    uint256 public number = 5;

    // default
    function add() external {
        number = number + 1;
    }

    // pure
    function addPure(
        uint256 _number
    ) external pure returns (uint256 new_number) {
        new_number = _number + 1;
    }

    // view
    function addView() external view returns (uint256 new_number) {
        new_number = number + 1;
    }
}
