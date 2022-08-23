// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IBullOrBear {
    
    function getTokenIdPosition(uint256 _tokenID) external view returns(uint8, uint256);
}
