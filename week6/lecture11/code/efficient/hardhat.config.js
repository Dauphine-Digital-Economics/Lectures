/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

module.exports = {
  solidity: {
    version: "0.8.18",
    settings: {
      optimizer: {
        enabled: true,
        runs: 10000
      }
    }
  },
  gasReporter: {
    currency: "EUR",
    gasPrice: 15,
    enabled: true
  },
};
