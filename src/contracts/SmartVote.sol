pragma solidity ^0.7.4;

contract SmartVote {
    address private administrator;

    modifier isAdministrator() {
        require(msg.sender == administrator);
        _;
    }

    function setAdministrator(address _newAdministrator) private {
        administrator = _newAdministrator;
    }

    function setDefaultAdministrator() public {
        require(administrator == address(0));
        setAdministrator(msg.sender);
    }
}