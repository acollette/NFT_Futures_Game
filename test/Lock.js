const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {

  

  it("Should return correct metadata", async function () {

    [owner, alice] = await ethers.getSigners();

    const BullOrBear = await hre.ethers.getContractFactory("BullOrBear");
    const bullOrBear = await BullOrBear.deploy(10000);
    await bullOrBear.deployed();

    console.log("main contract deployed to", bullOrBear.address);

    const SVG = await hre.ethers.getContractFactory("BullBearSVG");
    const svg = await SVG.deploy(bullOrBear.address);
    await svg.deployed();

    console.log("svg contract deployed to:", svg.address);

    await bullOrBear.setSvgContract(svg.address)


    let tx = await bullOrBear.connect(alice).mint({value: ethers.utils.parseEther("0.003")});
    tx.wait()
    let tx2 = await bullOrBear.connect(owner).mint({value: ethers.utils.parseEther("0.003")});
    tx2.wait()
    let tx3 = await bullOrBear.connect(alice).changePosition(1, 0);
    tx3.wait()
    let tx4 = await bullOrBear.connect(owner).changePosition(2, 1);
    tx4.wait()

    console.log(await bullOrBear.tokenURI(1));
    console.log(await bullOrBear.tokenURI(2));


  });
});