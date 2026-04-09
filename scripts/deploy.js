const hre = require("hardhat");

async function main() {
  console.log("Deploying Donation contract...");

  const Donation = await hre.ethers.getContractFactory("Donation");
  const donation = await Donation.deploy();

  await donation.waitForDeployment();

  const address = await donation.getAddress();

  console.log(`✅ Donation contract deployed to: ${address}`);

  // Save the address to a file so frontend can use it
  const fs = require("fs");
  const contractData = {
    address: address,
    network: hre.network.name
  };

  fs.writeFileSync(
    "./frontend/src/contractAddress.json",
    JSON.stringify(contractData, null, 2)
  );

  console.log("✅ Contract address saved to frontend/src/contractAddress.json");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});