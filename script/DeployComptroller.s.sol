// SPDX-License-Identifier: LGPL-3.0
pragma solidity >=0.8.13 <0.9.0;

import { Script } from "forge-std/Script.sol";

import { SablierV2Comptroller } from "src/SablierV2Comptroller.sol";

import { Common } from "./helpers/Common.s.sol";

/// @notice Deploys the SablierV2Comptroller contract.
contract DeployComptroller is Script, Common {
    function run() public broadcaster returns (SablierV2Comptroller comptroller) {
        comptroller = new SablierV2Comptroller();
    }

    /// @dev Deploys the contract at a deterministic address across all chains. Reverts if the contract has already
    /// been deployed via the deterministic CREATE2 factory.
    function runDeterministic() public broadcaster returns (bool success, SablierV2Comptroller comptroller) {
        bytes memory creationBytecode = type(SablierV2Comptroller).creationCode;
        bytes memory returnData;
        (success, returnData) = DETERMINISTIC_CREATE2_FACTORY.call(creationBytecode);
        comptroller = SablierV2Comptroller(address(uint160(bytes20(returnData))));
    }
}
