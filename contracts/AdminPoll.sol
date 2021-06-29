// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;
pragma abicoder v2;

import "./SmartVote.sol";
import "./SubAdministrator.sol";
import {SafeMath} from "./SafeMath.sol";

/**
* @title AdminPoll
* @dev The User contract is a subcontract to the SmartVote
* contract and to the SubAdministrator contract. It is there to
* represent all the interactions with an administrator poll.
*/
contract AdminPoll is SmartVote, SubAdministrator {
    /**
    * @dev This modifier will tell if a poll is available
    * to get a vote from a SmartVote user. It works with
    * the adminPollIsActive function.
    */
    modifier onlyActiveAdminPoll(uint _adminPollId) {
        require(adminPollIsActive(_adminPollId));
        _;
    }

    /**
    * @dev The adminPollIsActive function is a function that will return a bool,
    * true if the id of the given poll (_adminPollId) represents a poll that is
    * elligible for a vote from a user (if it's the time for it and if the poll
    * was accepted by the majority of the subadministrators).
    */
    function adminPollIsActive(uint _adminPollId) public view returns(bool) {
        require(_adminPollId < adminPolls.length);
        require(block.timestamp >= adminPolls[_adminPollId].pollDate[1]);
        require(block.timestamp < adminPolls[_adminPollId].pollDate[2]);

        uint8 positifVoteCount = 0;

        for (uint i = 0; i < numberSubAdministrator; i = SafeMath.add(i, 1)) {
            positifVoteCount += adminPolls[_adminPollId].subAdministratorAproval[i] ? 1 : 0;
        }
        if (positifVoteCount < SafeMath.add(SafeMath.div(numberSubAdministrator, 2), SafeMath.mod(numberSubAdministrator, 2))) {
            return false;
        }
        return true;
    }

    /**
    * @dev The creatAdminPoll function is only callable by the administrator.
    * It will create a new poll and put it in the adminPolls list. The new poll
    * is set with the 3 dates of events for the poll (_pollDate) and the
    * list of options for the vote (_candidateList).
    */
    function creatAdminPoll(uint64[3] memory _pollDate, string[] memory _candidateList) external
    onlyOwner {
        require(_candidateList.length > 0);

        bool[numberSubAdministrator] memory defaultSubAdministratorAproval;

        adminPolls.push(AdminPoll(_pollDate, _candidateList, defaultSubAdministratorAproval));
    }

    /**
    * @dev The subAdministratorAprovalSubmit is a function only callable by a subadministrator.
    * It will update the approval of a subadministrator (_vote) for a given poll (_adminPollId).
    * It will need the id of the subadministrator (_subAdministratorId) voting.
    */
    function subAdministratorAprovalSubmit(bool _vote, uint _adminPollId, uint _subAdministratorId) external onlySubAdministrator(msg.sender) {
        require(_adminPollId < adminPolls.length);
        require(msg.sender == subAdministrator[_subAdministratorId]);
        require(block.timestamp < adminPolls[_adminPollId].pollDate[0]);

        adminPolls[_adminPollId].subAdministratorAproval[_subAdministratorId] = _vote;
    }
}