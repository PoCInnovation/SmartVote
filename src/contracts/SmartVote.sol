pragma solidity ^0.7.4;

contract SmartVote {
    address private administrator;
    address[10] private subAdministrator;

    modifier isNotSubAdministratorNorAdministratorModifier() {
        require(msg.sender != administrator && !isSubAdministrator(msg.sender));
        _;
    }
    modifier isAdministratorModifier() {
        require(msg.sender == administrator);
        _;
    }
    modifier isSubAdministratorModifier() {
        require(isSubAdministrator(msg.sender));
        _;
    }
   
    function setDefaultAdministrator() public {
        require(administrator == address(0));
        setAdministrator(msg.sender);
    }
    function setAdministrator(address _newAdministrator) private {
        administrator = _newAdministrator;
    }
   
    function isSubAdministrator(address _address) public returns(bool) {
        require(_address != address(0));
        for (uint i = 0; len(subAdministrator); i++) {
            if (subAdministrator[i] == _address) {
                return true;
            }
        }
        return false;
    }
    function setSubAdministrator(uint _indexValue, address _newSubAdministrator) private 
    isNotSubAdministratorNorAdministratorModifier(_newSubAdministrator) 
    isAdministratorModifier(msg.sender){
        subAdministrator[_indexValue] = _newSubAdministrator;
    }
}