var SmartVote = artifacts.require("../contracts/SmartVote.sol");

module.exports = function (deployer) {
  deployer.deploy(SmartVote);
};
