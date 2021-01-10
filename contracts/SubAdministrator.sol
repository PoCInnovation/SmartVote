// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";

/**
* @title SubAdministrator
* @dev The SubAdministrator contract is a subcontract to the SmartVote
* contract. It is there to represent all the interaction with
* a subadministrator or by a user of subadministrator.
*/
contract SubAdministrator is SmartVote {
    /**
    * @dev This modifier will tell if a given address represent
    * one of the subadministrator. It works with the isSubAdministrator
    * function.
    */
    modifier onlySubAdministrator(address _address) {
        require(isSubAdministrator(_address));
        _;
    }

    /**
    * @dev The isSubAdministrator will return a bool, true if the
    * given address (_address) represent the address of a subadministrator,
    * and false if he is not.
    */
    function isSubAdministrator(address _address) public view returns(bool) {
        require(_address != address(0));
        for (uint8 i = 0; i < numberSubAdministrator; i++) {
            if (subAdministrator[i] == _address) {
                return true;
            }
        }
        return false;
    }

    /**
    * @dev The setSubAdministrator function is only callable by the administrator.
    * It will set the given address (_address) as a subadministrator at the given
    * position (_indexValue) in the array.
    */
    function setSubAdministrator(uint _indexValue, address _newSubAdministrator) private
    onlyOwner {
        require(_indexValue < numberSubAdministrator);
        require(!isSubAdministrator(_newSubAdministrator));
        subAdministrator[_indexValue] = _newSubAdministrator;
    }
}