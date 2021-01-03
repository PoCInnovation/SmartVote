// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./ownable.sol";

contract SmartVote is Ownable {
    uint8 constant public numberSubAdministrator = 12;
    address[numberSubAdministrator] public subAdministrator;

    struct User {
      string name;
      string nationality;
      uint64 birthDate;
      bool activatedAcount;
    }

    User[] public users;
    mapping (address => uint) public adressToUserId;
}