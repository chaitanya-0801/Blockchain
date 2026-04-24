async function main() {
    const SupplyChain = await ethers.getContractFactory("SupplyChain");

    const supplyChain = await SupplyChain.deploy();

    await supplyChain.deployed();

    console.log("Contract deployed to:", supplyChain.address);
}

main();