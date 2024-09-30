# Scholarship Platform Frontend

This project is the frontend interface for the **StudyScholarships** smart contract built on the Aptos blockchain. It allows users to create, view, apply for, and distribute scholarships in a decentralized way. The project is developed using **React** and **TypeScript**, with **Ant Design** for the user interface and **Aptos SDK** for blockchain interactions.

## Features

- **Create Scholarships**: Donors can create scholarships by specifying the amount, eligibility criteria, and duration.
- **View Scholarships**: Applicants can browse available scholarships, including detailed information about each one.
- **Apply for Scholarships**: Eligible students can apply for scholarships by submitting their academic information.
- **Distribute Scholarships**: Donors can distribute funds to qualified recipients.
- **Emergency Close**: Donors can close a scholarship and withdraw remaining funds if needed.

## Prerequisites

Ensure you have the following installed before running the project:

- **Node.js** (v14.x or later)
- **npm** or **yarn** (for dependency management)
- **Aptos-compatible wallet** (e.g., Petra Wallet) for interacting with the blockchain

## Wallet Setup

Make sure your Aptos-compatible wallet is set to **Devnet** for development purposes:

1. Install **Petra Wallet** or another Aptos-compatible wallet.
2. Switch the wallet network to **Devnet**.
3. Use the **Aptos Faucet** to fund your account with test tokens.

## Getting Started

### 1. Install Dependencies

Run the following command to install all the necessary packages:

```bash
npm install
```

### 2. Configure the Environment

Create a `.env` file and specify your **Aptos Devnet** or **Testnet** endpoint URLs:

```bash
VITE_APP_NETWORK=testnet
VITE_MODULE_ADDRESS="0x5fbab942388be12bc96e623fcc22d7c71bd76bede6a0b828de4c351e7aebcc1e"
```

### 3. Run the Development Server

Launch the application locally using the command:

```bash
npm run dev
```

Once the server starts, open your browser and navigate to `http://localhost:5174`.

## Interacting with the Application

1. **Connect Wallet**: On the landing page, click "Connect Wallet" and connect your **Petra Wallet** (or any Aptos-compatible wallet).
2. **Create a Scholarship**: Navigate to the "Create Scholarship" section, fill in the scholarship details (e.g., name, amount per applicant, GPA criteria, field of study), and submit. This will create a scholarship on the blockchain.
3. **View Scholarships**: Browse through the list of available scholarships and see the details for each.
4. **Apply for a Scholarship**: As a student, you can apply to scholarships by providing your GPA and field of study.
5. **Distribute Scholarships**: Donors can distribute the scholarship amount to qualified recipients.
6. **Emergency Close**: Donors can close the scholarship early and withdraw any remaining funds.

## Tech Stack

- **React** (JavaScript library for building user interfaces)
- **TypeScript** (Strongly typed JavaScript)
- **Ant Design** (UI library for elegant and responsive components)
- **Tailwind CSS** (Utility-first CSS framework for responsive design)
- **Aptos SDK** (Aptos blockchain interaction)

## Smart Contract Overview

The **StudyScholarships** smart contract manages the creation and distribution of scholarships. Below is a summary of key functions.

### Token Functions

1. **initialize_balance(user: &signer)**: Initializes a zero balance for the user.
2. **issue_tokens(user: &signer, amount: u64)**: Issues tokens to a user (typically a donor).
3. **get_balance(account: address)**: Retrieves the balance of a user.
4. **transfer_tokens(from: &signer, to: address, amount: u64)**: Transfers tokens between accounts.

### Scholarship Management

1. **initialize_scholarships(user: &signer)**: Initializes a scholarship list for the user.
2. **create_scholarship(user: &signer, scholarship_id: u64, name: String, amount_per_applicant: u64, total_applicants: u64, criteria_gpa: u64, field_of_study: String, duration: u64)**: Creates a new scholarship.
3. **apply_for_scholarship(user: &signer, scholarship_id: u64, gpa: u64, field_of_study: String)**: Allows students to apply for a specific scholarship.
4. **distribute_scholarship(user: &signer, scholarship_id: u64)**: Distributes the scholarship funds to all qualified recipients.
5. **emergency_close_scholarship(user: &signer, scholarship_id: u64)**: Closes the scholarship and refunds any remaining balance to the donor.

### Viewing Functions

1. **view_donor_address_of_scholarship(scholarship_id: u64)**: Returns the donor's address for a specific scholarship.
2. **view_all_scholarships()**: Retrieves a list of all scholarships.
3. **view_all_scholarships_created_by_address(account: address)**: Retrieves scholarships created by a specific donor.
4. **view_all_scholarships_applied_by_address(account: address)**: Retrieves a list of scholarships an applicant has applied to.

## Testing the Platform

- Use the **Aptos Faucet** to fund your test accounts on **Devnet**.
- Interactions like creating, applying, and distributing scholarships trigger blockchain transactions. Ensure you have enough test tokens for gas fees.
- Check your wallet for transaction requests when interacting with the platform.

## Additional Notes

- **Responsive Design**: This platform is fully responsive using **Tailwind CSS**. It supports mobile, tablet, and desktop viewports.
- **Security**: Smart contract interactions, such as creating scholarships and distributing funds, require user signatures via the wallet.
- **Custom UI**: **Ant Design** provides a user-friendly and polished experience with form validation and pre-designed UI components.
