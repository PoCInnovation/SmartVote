const solc = require("solc");
const fs = require("fs");

let preCompile = {
  language: "Solidity",
  sources: {
    "SmartVote.sol": {
      content: require("fs").readFileSync("./contracts/SmartVote.sol", "utf8"),
    },
    "SubAdministrator.sol": {
      content: require("fs").readFileSync(
        "./contracts/SubAdministrator.sol",
        "utf8"
      ),
    },
    "User.sol": {
      content: require("fs").readFileSync("./contracts/User.sol", "utf8"),
    },
    "AdminPoll.sol": {
      content: require("fs").readFileSync("./contracts/AdminPoll.sol", "utf8"),
    },
    "ownable.sol": {
      content: require("fs").readFileSync("./contracts/ownable.sol", "utf8"),
    },
  },
  settings: {
    outputSelection: {
      "*": {
        "*": ["*"],
      },
    },
  },
};

const output = JSON.parse(solc.compile(JSON.stringify(preCompile)));
console.log(output);

fs.writeFileSync(
  "./src/out/abi.json",
  JSON.stringify(output.contracts["SmartVote.sol"].SmartVote.abi)
);
fs.writeFileSync(
  "./src/out/bytecode.json",
  JSON.stringify(output.contracts["SmartVote.sol"].SmartVote.evm.bytecode)
);
