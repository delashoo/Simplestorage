//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17; // Instructing the compiler to use solidity version 0.8.17 and above

contract SimpleStorage //every single smart contract has an address
 {
   uint256 favoritenumber; //initializes the uint256 to solidity's default when left blank, zero
   People public person = People({favoritenumber: 24, name: "Delashoo"});// creating a new Person in the struct 

   mapping (string => uint256) public nameToFavoriteNumber;

   struct People {
        uint256 favoritenumber;
        string name;
   }

   People[] public people;//dynamic array bc the size is not given at initialization

    function Store(uint256 _favNumber) public returns (uint256) {
        favoritenumber = _favNumber; //
    }

    function retrieve() public view returns (uint256) {
        return favoritenumber; //this is a view function, it only reads from the blockchain thus costs no gas fee
    }

    function addPerson(string memory _name, uint256 _favNumber) public returns () {
        people.push(People(_favNumber, _name)); // Adding to the people array 
        nameToFavoriteNumber[_name] = _favNumber;// adds to the mapping   
    }
}