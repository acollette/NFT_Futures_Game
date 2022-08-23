

const hre = require("hardhat");
const { ethers } = require("hardhat");

async function main(){
    const accounts = await ethers.getSigners()
    const signer = accounts[0]
    const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
    const MainContract = await hre.ethers.getContractAt("BullOrBear", contractAddress, signer);

    
    const tx1 = await MainContract.mint({value: ethers.utils.parseEther("0.003")});
    tx1.wait(2);
    const tx2 = await MainContract.changePosition(1, 2);
    tx2.wait(2);

    const tx3 = await MainContract.tokenURI(1);
    console.log(tx3);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });