var SubAdministrator = artifacts.require("../contracts/SubAdministrator.sol");

module.exports = function (deployer) {
  deployer.deploy(SubAdministrator);
};
