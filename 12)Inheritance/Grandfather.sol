// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Grandfather {
    event Log(string msg);

    constructor() {
        emit Log("Grandfather");
    }

    // Apply inheritance to the following 2 functions: hip(), pop()
    function hip() public virtual {
        emit Log("Grandfather");
    }

    function pop() public virtual {
        emit Log("Grandfather");
    }
}

contract Father is Grandfather {
    // Apply inheritance to the following 2 functions: hip() and pop()，then change the log value to "Father".
    function hip() public virtual override {
        emit Log("Father");
    }

    function pop() public virtual override {
        emit Log("Father");
    }

    function father() public virtual {
        emit Log("Father");
    }
}

contract Son is Grandfather, Father {
    // Apply inheritance to the following 2 functions: hip() and pop()，then change the log value to "Son".
    function hip() public virtual override(Grandfather, Father) {
        emit Log("Son");
    }

    function pop() public virtual override(Grandfather, Father) {
        emit Log("Son");
    }
}
