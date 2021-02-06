module.exports = {
  compilers: {
    solc: {
      version: "^0.7.4",
    },
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
  },
};
