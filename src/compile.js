const solc = require("solc");
const fs = require("fs");

let preCompile = {
  language: "Solidity",
  sources: {
    "SmartVote.sol": {
      content: require("fs").readFileSync(
        "./src/contracts/SmartVote.sol",
        "utf8"
      ),
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

fs.writeFileSync(
  "./src/out/abi.json",
  JSON.stringify(output.contracts["SmartVote.sol"].SmartVote.abi)
);
fs.writeFileSync(
  "./src/out/bytecode.json",
  JSON.stringify(output.contracts["SmartVote.sol"].SmartVote.evm.bytecode)
);
