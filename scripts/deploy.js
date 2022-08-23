// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
 const BullOrBear = await hre.ethers.getContractFactory("BullOrBear");
 const bullOrBear = await BullOrBear.deploy(10000);
 await bullOrBear.deployed();

 console.log("main contract deployed to", bullOrBear.address);

 const SVG = await hre.ethers.getContractFactory("BullBearSVG");
 const svg = await SVG.deploy(bullOrBear.address);
 await svg.deployed();

 console.log("svg contract deployed to:", svg.address);

 await bullOrBear.setSvgContract(svg.address)



}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
