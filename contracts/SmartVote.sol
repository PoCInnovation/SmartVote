// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./ownable.sol";

/**
* @title SmartVote
* @dev The SmartVote contract is the main part for the SmartVote project,
* it is for now filled with the basic set up for the projet, such as
* variables and structures that we will need through the project.
*/
contract SmartVote is Ownable {
    /**
    * @dev The numberSubAdministrator variable is set to work with the
    * subAdministrator variable, it define how many subAdministrators there
    * will be. The subAdministrator array represents the address of all
    * the users set as subadministrator.
    */
    uint8 constant public numberSubAdministrator = 12;
    address[numberSubAdministrator] public subAdministrator;

    /**
    * @dev The User structure is there to represent what a user of SmartVote
    * will be. For now, the user has the following fields:
    * -name: a string representing the name of the user
    * -nationality: a string representing the nationality of the user
    * -birthDate: a uint64 representing a timestemp of the day of birth of the user
    * -activatedAcount: a bool defining if the user has an activated acount
    */
    struct User {
      string name;
      string nationality;
      uint64 birthDate;
      bool activatedAcount;
    }

    /**
    * @dev To easly find a user, we creat a mapping linkind address to user.
    */
    mapping (address => User) public users;

    /**
    * @dev The AdminPoll structure is there to represent a poll created by the
    * administrator. For now, the poll has the following fields:
    * -pollDate: an array of 3 representing the 3 key dates of the poll as a timestemp:
    *           -0: the date of the final validation of the subadministrators
    *           -1: the date of the start of the poll, when the user will be able to vote
    *           -2: the date of the end of the poll, when the user wont be able to vote anymore
    * -candidateList: an array of string representing the list of the options of vote for the user
    * -subAdministratorAproval: an array of bool representing the subadministrators approvals of
    * the poll proposition by the administrator. Each element of the array represents the choice of
    * a specific subadministrator
    */
    struct AdminPoll {
      uint64[3] pollDate;
      string[] candidateList;
      bool[numberSubAdministrator] subAdministratorAproval;
    }

    /**
    * @dev The adminPolls variable is the historic of all the previous polls proposed
    * by the administrator.
    */
    AdminPoll[] internal adminPolls;
}