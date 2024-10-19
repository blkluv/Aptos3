# 🚀 Public Opinion Poll - Frontend

Welcome to the **Public Opinion Poll** frontend, a decentralized application built on the **Aptos Blockchain**. This platform enables users to create polls, participate in voting, and view results transparently and securely through blockchain-based smart contracts. Poll creators can manage participation and finalize results with seamless identity verification using DIDs (Decentralized Identifiers).

---

## 🔗 Links

- **Live Demo**: [Public Opinion Poll](https://aptos-opinion-poll.vercel.app)
- **Smart Contract Explorer**: [Aptos Explorer](https://explorer.aptoslabs.com/account/0x53ebd2be721663376dc5a39997d54f160bfb4195da6db5edb97fab2927e90c37/modules/code/OpinionPoll?network=testnet)

---

## ✨ Key Features

- **Create Polls**: Users can create new polls by defining a question and multiple-choice options.
- **Vote on Polls**: Participants can vote for options in open polls using their DIDs.
- **View Poll Results**: Users can view real-time poll results with individual and total vote counts.
- **Close Polls**: Poll creators can close polls to end voting and finalize results.
- **DID Verification**: Votes are linked to users’ DIDs to prevent duplicate voting and ensure transparency.

---

## 📋 Prerequisites

Make sure you have the following installed:

- **Node.js** (v16 or higher)
- **npm** or **yarn**
- **Aptos Wallet** (e.g., **Petra Wallet**) for blockchain transactions

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

Clone the project and navigate to the project folder:

```bash
cd public-opinion-poll
```

### 2. Install Dependencies

Install the necessary dependencies:

```bash
npm install
```

### 3. Configure Environment Variables

Create a `.env` file in the root directory and add:

```bash
VITE_APP_NETWORK=testnet
VITE_MODULE_ADDRESS="0x53ebd2be721663376dc5a39997d54f160bfb4195da6db5edb97fab2927e90c37"
```

### 4. Run the Development Server

Start the local server with:

```bash
npm run dev
```

The app will be available at [http://localhost:5173](http://localhost:5173).

### 5. Deploy the Smart Contract

To deploy the smart contract:

1.  Install **Aptos CLI**.
2.  Update the **Move.toml** file with your wallet address:

    - Add you Wallet Address from Petra here

    ```bash
    poll_addrx = "0xca10b0176c34f9a8315589ff977645e04497814e9753d21f7d7e7c3d83aa7b57"
    ```

3.  Create your new Address for Deployment

    ```bash
    aptos init
    ```

    - Add your Account addr here for Deployment

    ```bash
    my_addrx = "53ebd2be721663376dc5a39997d54f160bfb4195da6db5edb97fab2927e90c37"
    ```

4.  Compile and publish the contract:

    ```bash
    aptos move compile
    aptos move publish
    ```

---

## 🛠 How to Use the Platform

### 1. Connect Wallet

- Click **Connect Wallet** to link your Aptos wallet (e.g., Petra Wallet).
- This allows you to create polls, cast votes, and manage your participation.

### 2. Create a Poll

1. Navigate to **Create Poll**.
2. Provide the poll question and options.
3. Submit to create the poll on the blockchain.

### 3. Vote on a Poll

1. Browse available polls under **Active Polls**.
2. Select a poll and enter your vote along with your DID.
3. Confirm the transaction via your wallet to cast your vote.

### 4. View Poll Results

Users can browse the **Results** section to view detailed voting results, including:

- Total votes per option
- Overall participation
- Status of the poll (Open/Closed)

### 5. Close a Poll (For Creators)

Poll creators can:

1. Navigate to **Manage Polls**.
2. Select a poll and click **Close Poll**.
3. Finalize the poll, locking the results.

---

## 📊 Scripts

- **`npm run dev`**: Starts the development server.
- **`npm run build`**: Builds the app for production.
- **`npm test`**: Runs tests.

---

## 🔍 Dependencies

- **React**: JavaScript library for building user interfaces.
- **TypeScript**: Typed superset of JavaScript for enhanced development.
- **Aptos SDK**: For interacting with the Aptos blockchain.
- **Ant Design**: Elegant and responsive UI components.
- **Tailwind CSS**: Utility-first framework for custom styling.
- **Petra Wallet Adapter**: For wallet integration with Aptos.

---

## 📚 Available Smart Contract Functions

1. **create_poll(account, question, options)**: Creates a poll on the blockchain.
2. **vote(did, poll_id, option_index)**: Records a user's vote.
3. **get_poll(poll_id)**: Retrieves poll details, including options and votes.
4. **get_poll_results(poll_id)**: Fetches the total votes for each option.
5. **close_poll(account, poll_id)**: Closes the poll to end voting.

---

## 🛡 Security and Transparency

- **Smart Contracts**: All poll operations are managed by blockchain-based smart contracts.
- **DID Verification**: Votes are linked to users’ decentralized identifiers to ensure transparency and fairness.
- **Immutable Records**: All transactions and votes are permanently recorded on the blockchain.

---

## 🌐 Common Issues and Solutions

1. **Wallet Connection Issues**: Ensure your Aptos-compatible wallet is installed and set to the correct network (e.g., **Testnet**).
2. **RPC Rate Limits**: If public RPC nodes reach their request limits, consider using private RPC nodes.
3. **Transaction Failures**: Verify wallet permissions and ensure sufficient test tokens for gas fees.

---

## 🚀 Scaling and Deployment

If deploying on **Vercel** or other platforms, you may encounter RPC rate limits. Consider:

- Using **QuickNode** or **Alchemy** as RPC providers.
- Implementing **request throttling** to avoid exceeding limits.
- Switching to **WebSockets** for real-time updates.

---

## 🎉 Conclusion

The **Public Opinion Poll** platform offers a secure and transparent way to create, participate in, and manage polls using the power of blockchain. With a user-friendly interface and reliable identity verification through DIDs, the platform ensures fairness in voting and a seamless experience for both participants and poll creators.
