// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.13;

import { ProStream } from "src/types/Structs.sol";

import { ProTest } from "../ProTest.t.sol";

contract GetStream__Test is ProTest {
    /// @dev it should return a zeroed out stream struct.
    function testGetStream__StreamNonExistent() external {
        uint256 nonStreamId = 1729;
        ProStream memory actualStream = pro.getStream(nonStreamId);
        ProStream memory expectedStream;
        assertEq(actualStream, expectedStream);
    }

    modifier StreamExistent() {
        _;
    }

    /// @dev it should return the stream struct.
    function testGetStream() external StreamExistent {
        uint256 defaultStreamId = createDefaultStream();
        ProStream memory actualStream = pro.getStream(defaultStreamId);
        ProStream memory expectedStream = defaultStream;
        assertEq(actualStream, expectedStream);
    }
}
