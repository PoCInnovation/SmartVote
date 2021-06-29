const truffleAssert = require("truffle-assertions");

var User = artifacts.require("User");

contract("User", (accounts) => {
  ////////////////////// test the creatUser function //////////////////////
  // it("should creat a new user", async () => {
  //   let userContract = await User.deployed();
  //   await userContract.creatUser(accounts[1], "user", "french", 974397687, {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   let newUser = await userContract.users(accounts[1]);
  //   assert.equal(
  //     `{${newUser.valueOf().name}, ${newUser.valueOf().nationality}, ${
  //       newUser.valueOf().birthDate
  //     }, ${newUser.valueOf().activatedAcount}}`,
  //     `{user, french, 974397687, true}`,
  //     "The user was not created"
  //   );
  // });
  // it("should return an error when creatUser is called as not an Administrator", async () => {
  //   let userContract = await User.deployed();
  //   await truffleAssert.reverts(
  //     userContract.creatUser.call(accounts[1], "user", "french", 974397687, {
  //       from: accounts[1],
  //     })
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
  ///////////////////// test the disableUser function /////////////////////
  // it("should disable a user", async () => {
  //   let userContract = await User.deployed();
  //   await userContract.creatUser(accounts[1], "user", "french", 974397687, {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   await userContract.disableUser(accounts[1], {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   let newUser = await userContract.users(accounts[1]);
  //   assert.equal(
  //     `{${newUser.valueOf().name}, ${newUser.valueOf().nationality}, ${
  //       newUser.valueOf().birthDate
  //     }, ${newUser.valueOf().activatedAcount}}`,
  //     `{user, french, 974397687, false}`,
  //     "The user was not created"
  //   );
  // });
  // it("should return an error when disableUser is called as not an Administrator", async () => {
  //   let userContract = await User.deployed();
  //   await userContract.creatUser(accounts[1], "user", "french", 974397687, {
  //     from: accounts[0],
  //     gas: 300000,
  //   });
  //   await truffleAssert.reverts(
  //     userContract.disableUser(accounts[1], {
  //       from: accounts[1],
  //       gas: 300000,
  //     })
  //   );
  // });
  // it("should return an error when disableUser is called for not a user", async () => {
  //   let userContract = await User.deployed();
  //   await truffleAssert.reverts(
  //     userContract.disableUser(accounts[1], {
  //       from: accounts[0],
  //       gas: 300000,
  //     })
  //   );
  // });
  /////////////////////////////////////////////////////////////////////////
});
