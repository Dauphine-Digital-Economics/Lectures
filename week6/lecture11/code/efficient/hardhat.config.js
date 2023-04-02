/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

module.exports = {
  solidity: "0.8.18",
  gasReporter: {
    currency: "EUR",
    gasPrice: 15,
    enabled: true
  }
};
