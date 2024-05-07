
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Coin{
    address public  minter;
    mapping (address=>uint) public  balance;

    event sent(address from ,address to ,uint amount);
//global intialization
    constructor(){
        minter=msg.sender;

    }
    function mint(address recieve,uint amount) public {
        require(msg.sender==minter);
        balance[recieve]+=amount;
            }

            error Insufficentbalance();
}