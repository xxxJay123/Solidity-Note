// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Function_Output {
    //Return values (return and returns)

    // returning multiple variables
    function returnMultiple()
        public
        pure
        returns (uint256, bool, uint256[3] memory)
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // named returns
    function returnNamed()
        public
        pure
        returns (uint256 _number, bool _bool, uint256[3] memory _array)
    {
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 1];
    }

    // Named return, still support return
    function returnNamed2()
        public
        pure
        returns (uint256 _number, bool _bool, uint256[3] memory _array)
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // Read return values, destructuring assignments
    function readReturn() public pure {
        // Read all return values
        uint256 number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (number, _bool, _array) = returnNamed();

        // Read part of return valuse, using destructuring assignment
        (, _bool2, ) = returnNamed();
    }
}
