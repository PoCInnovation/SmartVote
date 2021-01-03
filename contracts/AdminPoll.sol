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
        require(_adminPollId < adminPolls.lengh);
        require(now >= adminPolls[_adminPollId].pollDate[1] && now < adminPolls[_adminPollId].pollDate[2]);
        uint8 positifVoteCount = 0;
        for (uint i = 0; i < numberSubAdministrator; i++) {
           if (adminPolls[_adminPollId].subAdministratorAproval[i]) {
               positifVoteCount++;
           } else {
                positifVoteCount--;
           }
        }
        if (positifVoteCount <= 0)
            return false;
        return true;
    }

    function creatAdminPoll(uint[] _pollDate, string[] memory _candidateList) private
    onlyOwner {
        require(_pollDate.lengh == 3 && _candidateList > 0);
        
        bool[numberSubAdministrator] defaultSubAdministratorAproval;
        for (uint i = 0; i < numberSubAdministrator; i++) {
            defaultSubAdministratorAproval[i] = false;
        }
        adminPolls.push(AdminPoll(_pollDate, _candidateList, defaultSubAdministratorAproval));
    }
    function subAdministratorAprovalSubmit(bool _vote, uint _adminPollId, uint _subAdministratorId) private onlySubAdministrator(msg.sender) {
        require(msg.sender == subAdministrator[_subAdministratorId]);
        require(now < adminPolls[_adminPollId].pollDate[0]);
        adminPolls[_adminPollId].subAdministratorAproval[_subAdministratorId] = _vote;
    }
}