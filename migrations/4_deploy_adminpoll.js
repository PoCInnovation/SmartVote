var AdminPoll = artifacts.require("../contracts/AdminPoll.sol");

module.exports = function (deployer) {
  deployer.deploy(AdminPoll);
};
