pragma solidity ^0.4.17;

// Assert statements used for testing contracts
import "truffle/Assert.sol";
// Addresses for the test instance of contract
import "truffle/DeployedAddresses.sol";
// Contract to be tested
import "../contracts/Adoption.sol";

contract TestAdoption {

  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Testing the adopt() function
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);
    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of PetID 8 should be recorded.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    //Expected owner is this contract
    address expected = this;
    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of PetID 8 should be recorded.");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Expected owner is this contract
    address expected = this;

    // Store adopters in memory rather than contracts storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of PetID 8 should be recorded");
  }

}
