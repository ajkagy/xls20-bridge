<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/ajkagy/xls20-bridge">
    <img src="https://bridge.xrplive.com/images/FLF6hSsWQAMd_7H.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">ERC721 to XLS20 NFT Bridge</h3>

  <p align="center">
    A one way decentralized issuer bridge from ERC721 to XLS20 NFT standards.
    <br />
    <a href="https://bridge.xrplive.com">View Demo</a>
    ·
    <a href="https://github.com/ajkagy/xls20-bridge/issues">Report Bug</a>
    ·
    <a href="https://github.com/ajkagy/xls20-bridge/issues">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#Prerequisites">Prerequisites</a></li>
        <li><a href="#Installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

![Bridge Architecture](https://github.com/ajkagy/xls20-bridge/blob/master/bridge_architecture_v2.png?raw=true)

A one way proof of concept ERC721 to XLS20 decentralized bridge

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [React.js](https://reactjs.org/)
* [Node.js](https://nodejs.org/)
* [Express.js](https://expressjs.com/)
* [C#/.NET Core](https://dotnet.microsoft.com/en-us/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow the steps to deploy each project based on the project architecture.

### Prerequisites

+ [NodeJs & NPM](https://nodejs.org/en/)
+ [Git](https://git-scm.com/downloads)
+ [.NET 5.0 Core Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/5.0)
+ [Visual Studio 2019 or greater](https://visualstudio.microsoft.com/downloads/) (Optional: Only for debugging the Bridge Master Process)
+ [Infura Account](https://infura.io/)
+ [Xumm Dev Account](https://apps.xumm.dev/)

### Installation

1. Generate 4 sets of public/private key pairs from the [XRPL Faucet](https://xrpl.org/xrp-testnet-faucet.html) for the XLS-20 Dev Net. Copy to a text file an save for later.
    - One of the key pairs will be for creating the multi-sig issuer wallet. The remaining 3 keys will be validator keys.

2. Deploy the [Ethereum Bridge contract](https://github.com/ajkagy/xls20-bridge/blob/master/contracts/XRPLBridge.sol) to Rinkeby Testnet. [Tutorial on how to deploy smart contracts in remix](https://www.youtube.com/watch?v=bZKVfXmzRDw)

3. Create a new multisig wallet on the XLS-20 Dev net by following the directions here: [https://github.com/X33-Labs/xrpl-multisig-wallet-creator](https://github.com/X33-Labs/xrpl-multisig-wallet-creator)
    - input the secret key to one of your generated key pairs into the masterMultiSigAccountSecret variable. Add the remaining 3 public keys into the accountSigners array variable.

4. Create the Express.js Proxy by following the directions here: [https://github.com/ajkagy/xls20-bridge-proxy](https://github.com/ajkagy/xls20-bridge-proxy)

5. Create the Bridge Web App by following the directions here: [https://github.com/ajkagy/xls20-bridge-webapp](https://github.com/ajkagy/xls20-bridge-webapp)

6. Create the C#/.NET Master Process by following the directions here: [https://github.com/ajkagy/xls20-bridge-master](https://github.com/ajkagy/xls20-bridge-master)

7. Create the validator app 3 times (one for each validator node) by following the directions here: [https://github.com/ajkagy/xls20-bridge-validator](https://github.com/ajkagy/xls20-bridge-validator)
    - If all 3 validators are running on the same machine for testing purposes, install each validator in a separate folder.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the Apache 2.0 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Adam Kagy - [@xrpl_Adam](https://twitter.com/xrpl_adam) - xrpldev@gmail.com

<p align="right">(<a href="#top">back to top</a>)</p>
