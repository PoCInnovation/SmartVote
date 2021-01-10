// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./SmartVote.sol";
import "./SubAdministrator.sol";

/**
* @title AdminPoll
* @dev The User contract is a subcontract to the SmartVote
* contract and the SubAdministrator contract. It is there to
* represent all the interaction with an administrator poll.
*/
contract AdminPoll is SmartVote, SubAdministrator {
    /**
    * @dev This modifier will tell if a poll is avalable for
    * to get a vote from a SmartVote's user. It works with
    * the adminPollIsActive function.
    */
    modifier onlyActiveAdminPoll(uint _adminPollId) {
        require(adminPollIsActive(_adminPollId));
        _;
    }

    /**
    * @dev The adminPollIsActive function is a function that will return a bool,
    * true if the id of the given poll (_adminPollId) represent a poll that is
    * eligible for a vote from a user (if it's the time for it and if the poll
    * was accepted by the magority of the subadministrator).
    */
    function adminPollIsActive(uint _adminPollId) public view returns(bool) {
        require(_adminPollId < adminPolls.length);
        require(block.timestamp >= adminPolls[_adminPollId].pollDate[1]);
        require(block.timestamp < adminPolls[_adminPollId].pollDate[2]);

        uint8 positifVoteCount = 0;

        for (uint i = 0; i < numberSubAdministrator; i++) {
            positifVoteCount += adminPolls[_adminPollId].subAdministratorAproval[i] ? 1 : 0;
        }
        if (positifVoteCount < ((numberSubAdministrator / 2) + (numberSubAdministrator % 2))) {
            return false;
        }
        return true;
    }

    /**
    * @dev The creatAdminPoll function is only callable by the administrator.
    * It will creat a new poll a put it in the adminPolls list. The new poll
    * is set with the 3 dates of event for the poll (_pollDate) and the
    * list of option for the vote (_candidateList).
    */
    function creatAdminPoll(uint[3] memory _pollDate, string[] memory _candidateList) private
    onlyOwner {
        require(_candidateList.length > 0);

        bool[numberSubAdministrator] memory defaultSubAdministratorAproval;

        adminPolls.push(AdminPoll(_pollDate, _candidateList, defaultSubAdministratorAproval));
    }

    /**
    * @dev The subAdministratorAprovalSubmit is a function only calble by a subadministrator.
    * It will update the aproval of a subadministrator (_vote) for a given poll (_adminPollId).
    * It will need the id of the subadministrator (_subAdministratorId) voting.
    */
    function subAdministratorAprovalSubmit(bool _vote, uint _adminPollId, uint _subAdministratorId) private onlySubAdministrator(msg.sender) {
        require(msg.sender == subAdministrator[_subAdministratorId]);
        require(block.timestamp < adminPolls[_adminPollId].pollDate[0]);

        adminPolls[_adminPollId].subAdministratorAproval[_subAdministratorId] = _vote;
    }
}