// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@lukso/lsp-smart-contracts/contracts/UniversalProfile.sol";

contract MyProfile is UniversalProfile(msg.sender) {

    constructor() {
        bytes32 foundryKey = keccak256("foundry");
        bytes memory foundryValue = hex"abcd";

        _setData(foundryKey, foundryValue);
    }


}