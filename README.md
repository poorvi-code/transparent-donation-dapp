## 🌐 Transparent Donation DApp  


A Blockchain-Based Donation Tracking System built using Ethereum, Hardhat, and React.
This project ensures transparency, trust, and accountability in donations by recording all transactions on the blockchain.

## Features

- 🪙 Create donation campaigns  
- 💸 Donate using Ethereum (ETH)  
- 📊 Transparent tracking of funds  
- 🔐 Secure & tamper-proof smart contracts  
- 👤 Campaign owner can withdraw funds after reaching goal  
- 🌍 Public visibility of all campaigns
  
## Tech Stack

- Blockchain: Ethereum  
- Smart Contracts: Solidity  
- Development Framework: Hardhat (v2)  
- Frontend: React.js  
- Web3 Library: Ethers.js (v5)  
- Wallet: MetaMask  

## Project Structure


donation-dapp/
│
├── contracts/ # Solidity smart contracts
├── scripts/ # Deployment scripts
├── artifacts/ # Compiled contract files
├── frontend/ # React frontend
│ └── src/
│ ├── Donation.json # ABI
│ └── contractAddress.json # Deployed contract address
│
├── hardhat.config.js
└── package.json


## ⚙️ Installation & Setup  


Follow these steps to run the project on your system:  


🔹 1. Clone the Repository  


git clone https://github.com/poorvi-code/transparent-donation-dapp.git  


cd donation-dapp  


🔹 2. Install Backend Dependencies (Hardhat)  


npm install  


🔹 3. Start Local Blockchain  


Open a terminal and run:  


npx hardhat node  


This starts a local Ethereum blockchain with test accounts.  


🔹 4. Deploy Smart Contract  


Open a new terminal and run:  


npx hardhat run scripts/deploy.js --network localhost  


This will:  


Deploy the contract  


Generate contract address 


Save it to frontend automatically  


🔹 5. Copy Contract ABI (if not already done)  


cp artifacts/contracts/Donation.sol/Donation.json frontend/src/  


🔹 6. Setup Frontend  


cd frontend  

npm install  


🔹 7. Start React App  


npm start  


App will run at:  


http://localhost:3000  


## 🦊 MetaMask Setup  


Install MetaMask extension  

Add a new network:  

Network Name: Localhost 8545  

RPC URL: http://127.0.0.1:8545  

Chain ID: 31337  

Import one of the accounts from Hardhat node using private key  


## 📜 Smart Contract Overview  


Main contract: Donation.sol  

## Key Functions

- createCampaign() → Create a new campaign  
- donate() → Donate ETH to a campaign  
- releaseFunds() → Withdraw funds after goal is reached  
- getAllCampaigns() → Fetch all campaigns  


## 🎯 Future Improvements

- 🔐 Add user authentication  
- 📷 Upload campaign images (IPFS)  
- 📊 Better UI dashboard  
- 🌐 Deploy on Ethereum testnet (Sepolia)  
- 📱 Mobile responsiveness  




## 🤝 Contributing  


Feel free to fork this repo and contribute!   


Pull requests are welcome. 



## 👩‍💻 Author  


Poorvi Rai K  


## ⭐ Support  


If you like this project, give it a ⭐ on GitHub!
