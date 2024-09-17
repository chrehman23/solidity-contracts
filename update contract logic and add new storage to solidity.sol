// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
 
contract Storage {

    address public owner;
    mapping(address=>uint256) public balances;

   
    function addBalance(address _address,uint256 _value) public {
        balances[_address] = _value;
    }
    function getBalance(address _address) public view   returns (uint256) {
        return balances[_address];
    }

}


contract Erc20 {
    string public name; 

    function updateName(string memory _name) public {
        name= _name;
    }

    function getName() public view returns (string memory) {
    return name;
    }
}

contract PublicContract {
    Storage public storageAddress;
    Erc20 public storageERC20Address; // deploy new contract and update this contract with new address

    constructor(Storage _address,Erc20 _erc20Address){
        storageAddress= _address;
        storageERC20Address =_erc20Address;
    } 

    function setName(string memory _name) public {
        string memory oldName = storageERC20Address.getName();
        require(keccak256(abi.encodePacked(_name)) != keccak256(abi.encodePacked(oldName)), "Same name cannot be updated"); // you can not compler strings in solidity. 
        storageERC20Address.updateName(_name);
    }
    function name() public view  returns(string memory) {
      return  storageERC20Address.getName();
    }

    function getAccountBalance(address _address) public view returns (uint256){
        return storageAddress.getBalance(_address);
    }

    function setAccountBalace(address _address,uint256 _value) public {
        require(_value>1000,"value is to short");
        storageAddress.addBalance(_address, _value);
    }
}


//Note
//This is basic example for update contract logic but in this case we can not update contract storage if that is requred we need to deploy new contract. 
// but this is not stander for make live things so no one can know about the main logic of the contract
