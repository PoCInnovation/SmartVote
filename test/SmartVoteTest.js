var SmartVote = artifacts.require("SmartVote");

contract("SmartVote", (accounts) => {
  it("should set depolyer as Administrator", async () => {
    let instance = await SmartVote.deployed();
    let owner = await instance.owner.call();
    assert.equal(
      owner.valueOf(),
      accounts[1],
      "The depolyer is not the Administrator"
    );
  });
});
