pragma solidity ^0.4.17;

contract Adoption {

  //Array of 16 ethereum addresses
  address[16] public adopters;

  //Function to adopt a pet
  function adopt(uint petId) public returns (uint) {

    //Require statement verifies correct address
    require(petId >=0 && petId <= 15);

    //Msg.sender has adopted petId
    adopters[petId] = msg.sender;
    return petId;
  }

  //Function for retrieving adopters
  function getAdopters() public view returns (address[16]) {
    return adopters;
  }
}
