// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

//Only contract owner should be able to mint tokens
//Any user can transfer tokens
//Any user can burn tokens

//import the ERC20 contract from the OpenZeppelin library.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";


//define a MyToken contract, inherit from the imported ERC20 contract.
//inheritance allows all functions and variables from ERC20 to be inherited by MyToken 
contract MyToken is ERC20{

    //declare a private state variable of type address
    //private restricts access to the variable within contract
    address private owner;

    //sets the initial state of the contract;
    //sets token name and symbol
    //initializes the owner variable with the ETH address of the sender who deployed the contract
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
    }

    //make sure that the sender of the transaction is the same as the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    //mint function allows owner to mint new tokens
    //only owner modifier ensure only owner can call the function
    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    //burn function allows any user to burn tokens
    //no modifier
    function burn(uint256 _amount) external{
        _burn(msg.sender, _amount);
    }
}
