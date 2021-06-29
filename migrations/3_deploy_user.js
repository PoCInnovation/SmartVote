var User = artifacts.require("../contracts/User.sol");

module.exports = function (deployer) {
  deployer.deploy(User);
};
