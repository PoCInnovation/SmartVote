var SmartVote = artifacts.require("SmartVote");

contract("SmartVote", (accounts) => {
  ////////////////////// test the SmartVote deployment //////////////////////

  it("should set depolyer as Administrator", async () => {
    let smartVoteContract = await SmartVote.deployed();

    let owner = await smartVoteContract.owner.call();
    assert.equal(
      owner.valueOf(),
      accounts[0],
      "The depolyer is not the Administrator"
    );

    let numberSubAdministrator = await smartVoteContract.numberSubAdministrator.call();
    assert.equal(
      numberSubAdministrator.valueOf(),
      12,
      "The depolyer is not the Administrator"
    );
  });

  /////////////////////////////////////////////////////////////////////////
});
