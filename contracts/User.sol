// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";

contract User is SmartVote {
    modifier onlyUser(address _address) {
        require(users[adressToUserId[_address]].activatedAcount);
        _;
    }

    function creatUser(address _newUser, string memory _name, string memory _nationality, uint64 _birthDate) private 
    onlyOwner {
        require(!users[adressToUserId[_newUser]].activatedAcount);
        users.push(User(_name, _nationality, _birthDate, true));
        uint id = users.length - 1; 
        adressToUserId[_newUser] = id;
    }
    function disableUser(address _adress) private onlyOwner onlyUser(_adress) {
        users[adressToUserId[_adress]].activatedAcount = false;
    }
}