pragma solidity ^0.7.4;

contract SmartVote {
    address private administrator;
    address[10] private subAdministrator;

    modifier isNotSubAdministratorNorAdministratorModifier(address _address) {
        require(msg.sender != administrator && !isSubAdministrator(msg.sender));
        _;
    }
    modifier isAdministratorModifier(address _address) {
        require(msg.sender == administrator);
        _;
    }
    modifier isSubAdministratorModifier(address _address) {
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
        for (uint i = 0; i < subAdministrator.length; i++) {
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