# Project Title

Project: Create and Mint Token

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has two functions, a mint function that increases the total supply and the balance of the sender address, and a burn function that subtracts the total supply and the balance of the sender address. The project requires that we (1)create our own token, (2)ensure that only the user can mint tokens, (3) any user can transfer tokens, and (4) any user can burn tokens.

## Getting Started

### Executing Program

To run this execute and run this program, you can use Remix, an online Solidity IDE. To get started, you may go to visit the Remix link:  https://remix.ethereum.org/.

Once you're at the Remix website, open the file explorer and look for the 'Create a new file' icon. Or, you could simply look for the 'New File' button at the Home page. Name your file with a '.sol' extension (e.g. myToken.sol). To execute the program, you may copy and paste the following code:

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

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile createAndMintToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by clicking on totalSupply to see how many tokens you have. And then, you may mint tokens by clicking the mint button. Make sure that you're using the correct account. You may mint any amount to your own account address. Clicking on total supply should reflect how much you minted to the address.

You may also transfer tokens to any address by clicking on transfer and inputting the recepient and the amount of tokens you want to transfer. Make sure the current address you're sending from has enough tokens to transfer.

You may also burn tokens using any account by clicking burn. Make sure the address you're using to burn tokens has enough tokens to burn.

## Author(s)

The author of this file is Nolene Ignacio

## License
This project is licensed under the MIT License
