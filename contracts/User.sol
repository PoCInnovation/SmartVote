// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";

contract User is SmartVote {
    modifier onlyUser(address _address) {
        require(users[_address].activatedAcount);
        _;
    }

    function creatUser(address _newUser, string memory _name, string memory _nationality, uint64 _birthDate) private 
    onlyOwner {
        require(!users[_newUser].activatedAcount);
        users[_newUser] = User(_name, _nationality, _birthDate, true);
    }
    function disableUser(address _address) private onlyOwner onlyUser(_address) {
        users[_address].activatedAcount = false;
    }
}