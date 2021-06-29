const truffleAssert = require("truffle-assertions");

var SubAdministrator = artifacts.require("SubAdministrator");

contract("SubAdministrator", (accounts) => {
  ///////////////// test the setSubAdministrator function /////////////////
  // it("should set user as sub-administrator", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await subAdministratorContract.setSubAdministrator(0, accounts[1], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   let subAdministratorAddress = await subAdministratorContract.subAdministrator.call(
  //     0
  //   );
  //   assert.equal(
  //     subAdministratorAddress.valueOf(),
  //     accounts[1],
  //     "The user is not a sub-administrator"
  //   );
  // });
  // it("should update the sub-administrator", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await subAdministratorContract.setSubAdministrator(0, accounts[1], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   await subAdministratorContract.setSubAdministrator(0, accounts[2], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   let subAdministratorAddress = await subAdministratorContract.subAdministrator.call(
  //     0
  //   );
  //   assert.equal(
  //     subAdministratorAddress.valueOf(),
  //     accounts[2],
  //     "The sub-administrator did not update corectly"
  //   );
  // });
  // it("should return an error when setSubAdministrator is called as not an Administrator", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await truffleAssert.reverts(
  //     subAdministratorContract.setSubAdministrator(0, accounts[1], {
  //       from: accounts[1],
  //       gas: 300000,
  //     })
  //   );
  // });
  // it("should return an error when setSubAdministrator is called with an out of bounds index", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await truffleAssert.reverts(
  //     subAdministratorContract.setSubAdministrator(100, accounts[1], {
  //       from: accounts[0],
  //       gas: 300000,
  //     })
  //   );
  // });
  // it("should return an error when setSubAdministrator is called with an already existing subadministraor", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await subAdministratorContract.setSubAdministrator(0, accounts[1], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   await truffleAssert.reverts(
  //     subAdministratorContract.setSubAdministrator(1, accounts[1], {
  //       from: accounts[0],
  //       gas: 300000,
  //     })
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
  ///////////////// test the isSubAdministrator function //////////////////
  // it("should know if is a sub-administrator", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await subAdministratorContract.setSubAdministrator(0, accounts[1], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   let returnValue1 = await subAdministratorContract.isSubAdministrator(
  //     accounts[1],
  //     {
  //       from: accounts[0],
  //       gas: 300000,
  //     }
  //   );
  //   let returnValue2 = await subAdministratorContract.isSubAdministrator(
  //     accounts[2],
  //     {
  //       from: accounts[0],
  //       gas: 300000,
  //     }
  //   );
  //   assert.equal(returnValue1, true);
  //   assert.equal(returnValue2, false);
  // });
  // it("should return an error when isSubAdministrator is called with a default address", async () => {
  //   let subAdministratorContract = await SubAdministrator.deployed();
  //   await truffleAssert.reverts(
  //     subAdministratorContract.isSubAdministrator(
  //       "0x0000000000000000000000000000000000000000",
  //       {
  //         from: accounts[0],
  //         gas: 300000,
  //       }
  //     )
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
});
