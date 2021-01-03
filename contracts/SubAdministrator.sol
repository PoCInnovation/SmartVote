// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";

contract SubAdministrator is SmartVote {
    modifier onlySubAdministrator(address _address) {
        require(isSubAdministrator(_address));
        _;
    }

    function isSubAdministrator(address _address) public view returns(bool) {
        require(_address != address(0));
        for (uint8 i = 0; i < numberSubAdministrator; i++) {
            if (subAdministrator[i] == _address) {
                return true;
            }
        }
        return false;
    }
    function setSubAdministrator(uint _indexValue, address _newSubAdministrator) private 
    onlyOwner {
        require(_indexValue < numberSubAdministrator);
        require(!isSubAdministrator(_newSubAdministrator));
        subAdministrator[_indexValue] = _newSubAdministrator;
    }
}