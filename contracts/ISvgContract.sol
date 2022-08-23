// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ISvgContract {

    function getSVG (uint256 _tokenID) external view returns (string memory _svgcode);
}