const truffleAssert = require("truffle-assertions");

var AdminPoll = artifacts.require("AdminPoll");

contract("AdminPoll", (accounts) => {
  /////////////////// test the creatAdminPoll function ////////////////////
  // it("should creat an adminPoll", async () => {
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.creatAdminPoll.call(
  //     [914781687, 974397687, 1081447287],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   assert.equal(true, true, "The poll was not created");
  // });
  // it("should return an error when creatAdminPoll is called as not an Administrator", async () => {
  //   let adminPollContract = await AdminPoll.deployed();
  //   await truffleAssert.reverts(
  //     adminPollContract.creatAdminPoll.call(
  //       [914781687, 974397687, 1081447287],
  //       ["Pierre", "Quentin", "Thomas"],
  //       {
  //         from: accounts[1],
  //       }
  //     )
  //   );
  // });
  // it("should return an error when creatAdminPoll is called with no _candidateList", async () => {
  //   let adminPollContract = await AdminPoll.deployed();
  //   await truffleAssert.reverts(
  //     adminPollContract.creatAdminPoll.call(
  //       [914781687, 974397687, 1081447287],
  //       []
  //     )
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
  /////////// test the subAdministratorAprovalSubmit function ////////////
  // it("should let a subAdmin aprove", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.setSubAdministrator.call(0, accounts[1]);
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate + 3600, actualDate + 7200, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await adminPollContract.subAdministratorAprovalSubmit.call(true, 0, 0, {
  //     from: accounts[1],
  //   });
  //   assert.equal(true, true);
  // });
  // it("should return an error when subAdministratorAprovalSubmit is called by not a subAdministrator", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate + 3600, actualDate + 7200, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await truffleAssert.reverts(
  //     adminPollContract.subAdministratorAprovalSubmit.call(true, 0, 0, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  // it("should return an error when subAdministratorAprovalSubmit is called with wrong subAdministratorId", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.setSubAdministrator.call(0, accounts[1]);
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate + 3600, actualDate + 7200, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await truffleAssert.reverts(
  //     adminPollContract.subAdministratorAprovalSubmit.call(true, 0, 1, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  // it("should return an error when subAdministratorAprovalSubmit is called with wrong adminPollId", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.setSubAdministrator.call(0, accounts[1]);
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate + 3600, actualDate + 7200, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await truffleAssert.reverts(
  //     adminPollContract.subAdministratorAprovalSubmit.call(true, 1, 0, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  // it("should return an error when subAdministratorAprovalSubmit is called with out of bounce value", async () => {
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.setSubAdministrator.call(0, accounts[1]);
  //   await truffleAssert.reverts(
  //     adminPollContract.subAdministratorAprovalSubmit.call(true, 100, 100, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  // it("should return an error when subAdministratorAprovalSubmit is called out of time", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.setSubAdministrator.call(0, accounts[1]);
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate - 3600, actualDate + 7200, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await truffleAssert.reverts(
  //     adminPollContract.subAdministratorAprovalSubmit.call(true, 0, 0, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
  ///////////////// test the adminPollIsActive function //////////////////
  // it("should know if poll is active true", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   for (let i = 1; i < accounts.length; i++)
  //     await adminPollContract.setSubAdministrator.call(i - 1, accounts[i]);
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate - 3600, actualDate, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   for (let i = 1; i < accounts.length; i++)
  //     await adminPollContract.subAdministratorAprovalSubmit.call(
  //       true,
  //       0,
  //       i - 1,
  //       {
  //         from: accounts[i],
  //       }
  //     );
  //   let returnValue = await adminPollContract.adminPollIsActive.call(0);
  //   assert.equal(returnValue, true);
  // });
  // it("should know if poll is active false", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate - 3600, actualDate, actualDate + 7800],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   let returnValue = await adminPollContract.adminPollIsActive.call(0);
  //   assert.equal(returnValue, true);
  // });
  // it("should return an error when adminPollIsActive with wrong adminPollId", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await truffleAssert.reverts(adminPollContract.adminPollIsActive.call(0));
  //   await truffleAssert.reverts(adminPollContract.adminPollIsActive.call(10));
  // });
  // it("should return an error when adminPollIsActive with wrong date", async () => {
  //   let actualDate = new Date().valueOf();
  //   let adminPollContract = await AdminPoll.deployed();
  //   await adminPollContract.creatAdminPoll.call(
  //     [actualDate - 7800, actualDate - 3600, actualDate - 1],
  //     ["Pierre", "Quentin", "Thomas"]
  //   );
  //   await truffleAssert.reverts(adminPollContract.adminPollIsActive.call(0));
  // });
  /////////////////////////////////////////////////////////////////////////
});
