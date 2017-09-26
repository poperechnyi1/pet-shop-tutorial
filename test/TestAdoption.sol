pragma solidity ^0.4.15;

import "truffle/Assert.sol";//contain different assertions which check on equality, inequality or emptiness to return a pass/fail boolean from our test.
import "truffle/DeployedAddresses.sol"; //this smart contract gets the address of the deployed contract
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet(){ //Testing The adopt() Function
        uint returnedId = adoption.adopt(8);//why 8 ??
        uint expected = 8;
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
    }

    function testGetAdopterAddressByPetId(){ //Retrieval of a Single Pet's Owner
        address expected = this; //take cuurent contract address
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "Owner of pet ID 8 shoul be recorded.");
    }


    function testGetAdopterAddressByPetIdInArray(){//Retrieval of All Pet Owners
        address expected = this;

        address[16] memory adopters = adoption.getAdopters();//in memory more faster than in storage

        Assert.equal(adopters[8], expected, "Owner of pet ID 8 shoul be recorded.");
    }



}