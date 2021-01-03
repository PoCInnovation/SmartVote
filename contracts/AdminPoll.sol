// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";
import "./SubAdministrator.sol";

contract AdminPoll is SmartVote, SubAdministrator {
    modifier onlyActiveAdminPoll(uint _adminPollId) {
        require(adminPollIsActive(_adminPollId));
        _;
    }

    function adminPollIsActive(uint _adminPollId) public view returns(bool) {
        require(_adminPollId < adminPolls.length);
        require(block.timestamp >= adminPolls[_adminPollId].pollDate[1] && block.timestamp < adminPolls[_adminPollId].pollDate[2]);
        
        uint8 positifVoteCount = 0;
        for (uint i = 0; i < numberSubAdministrator; i++) {
            positifVoteCount += adminPolls[_adminPollId].subAdministratorAproval[i] ? 1 : 0;
        }
        if (positifVoteCount < ((numberSubAdministrator / 2) + (numberSubAdministrator % 2))) {
            return false;
        }
        return true;
    }

    function creatAdminPoll(uint[3] memory _pollDate, string[] memory _candidateList) private
    onlyOwner {
        require(_candidateList.length > 0);
        
        bool[numberSubAdministrator] memory defaultSubAdministratorAproval;
        adminPolls.push(AdminPoll(_pollDate, _candidateList, defaultSubAdministratorAproval));
    }

    function subAdministratorAprovalSubmit(bool _vote, uint _adminPollId, uint _subAdministratorId) private onlySubAdministrator(msg.sender) {
        require(msg.sender == subAdministrator[_subAdministratorId]);
        require(block.timestamp < adminPolls[_adminPollId].pollDate[0]);

        adminPolls[_adminPollId].subAdministratorAproval[_subAdministratorId] = _vote;
    }
}