# Scholarship Platform Smart Contract

This repository contains the smart contract for the Scholarship Platform, written in the Move programming language. The smart contract is located in the `sources` folder.

## Try to use aptos names for best experience

- [AptosNames](https://testnet.aptosnames.com/)

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Scholarship Platform is designed to manage and distribute scholarships using blockchain technology. This smart contract ensures transparency, security, and efficiency in the scholarship distribution process.

## Features

The Scholarship Platform smart contract offers a comprehensive set of features to facilitate the management and distribution of scholarships. Below are the key features:

- **Scholarship Creation**: Institutions can create new scholarships by specifying the scholarship details such as eligibility criteria, application deadlines, and the amount of funds available.
- **Application Submission**: Students can submit their applications for scholarships directly through the platform. The application process is streamlined to ensure ease of use.
- **Approval Process**: The platform includes a robust approval process where scholarship applications can be reviewed and approved by designated authorities. This ensures that only eligible students receive scholarships.
- **Fund Distribution**: Once applications are approved, the smart contract manages the distribution of scholarship funds to the students. This process is automated to ensure timely and accurate fund transfers.
- **Transparency**: All transactions and processes are recorded on the blockchain, ensuring transparency and accountability. Both institutions and students can track the status of applications and fund distributions.
- **Security**: The use of blockchain technology ensures that all data is secure and tamper-proof. The smart contract is designed to prevent fraud and unauthorized access.
- **Efficiency**: The automated processes reduce the administrative burden on institutions and speed up the scholarship distribution process.
- **Integration**: The smart contract can be integrated with other systems and platforms, allowing for seamless interaction and data exchange.
- **Scalability**: The platform is designed to handle a large number of scholarships and applications, making it suitable for institutions of all sizes.
- **User-Friendly Interface**: The platform includes a user-friendly interface for both institutions and students, making it easy to navigate and use.

These features make the Scholarship Platform a powerful tool for managing scholarships efficiently and securely.

## Installation

To install and deploy the smart contract, follow these steps:

1. Goto Contracts:

   ```sh
   cd contract
   ```

2. Ensure you have the Move CLI installed. If not, follow the instructions [here](https://github.com/move-language/move).

3. Compile the smart contract:
   ```sh
   aptos move compile
   ```
4. Test the smart contract

- [Frontend](#frontend) We recommend you to test using our frontend
- [AptosExplorer](https://explorer.aptoslabs.com/account/0x5fbab942388be12bc96e623fcc22d7c71bd76bede6a0b828de4c351e7aebcc1e/modules/view/ScholarshipPlatform/view_complete_data_applicants_by_scholarship_id?network=testnet) If You want see how Smart contract functions (Change the contract address if you deployed your own)

## Usage

To interact with the smart contract, use the Move CLI or integrate it into your application. Here are some basic commands:

- Deploy the contract:

  ```sh
  aptos move publish
  ```

- Interact with the contract:
  ```sh
  move run <script_name>
  ```

## Contributing

We welcome contributions to improve the Scholarship Platform. Please fork the repository and submit a pull request with your changes. Ensure your code adheres to the project's coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
