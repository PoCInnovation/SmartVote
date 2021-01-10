// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";

/**
* @title User
* @dev The User contract is a subcontract to the SmartVote
* contract. It is there to represent all the interaction with
* a user or by a user of SmartVote.
*/
contract User is SmartVote {
    /**
    * @dev This modifier will tell if a given address represent
    * a SmartVote's user, and if he has an activated acount.
    */
    modifier onlyUser(address _address) {
        require(users[_address].activatedAcount);
        _;
    }

    /**
    * @dev The creatUser function is only callable by the administrator,
    * it will creat a new user from a given address (_newUser) and with his
    * information (_name, _nationality, _birthDate). His acount is automaticly
    * activated.
    */
    function creatUser(address _newUser, string memory _name, string memory _nationality, uint64 _birthDate) private
    onlyOwner {
        require(!users[_newUser].activatedAcount);
        users[_newUser] = User(_name, _nationality, _birthDate, true);
    }

    /**
    * @dev The disableUser function is only callable by the administrator and
    * can only be call for a user with an activated acount. It will unactivate
    * the acount of a given user (_address);
    */
    function disableUser(address _address) private onlyOwner onlyUser(_address) {
        users[_address].activatedAcount = false;
    }
}