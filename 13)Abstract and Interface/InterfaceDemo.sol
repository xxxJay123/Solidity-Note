// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface Base {
    function getFirstName() external pure returns (string memory);
    function getLastName() external pure returns (string memory);
}

contract BaseImpl is Base {
    function getFirstName() external pure override returns (string memory) {
        return "XXX";
    }
    function getLastName() external pure override returns (string memory) {
        return "YYY";
    }
}