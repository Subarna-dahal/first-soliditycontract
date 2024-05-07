// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lottery {
    address public manager;
    address payable[] public participants;
    address payable public winner;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 1 ether, "Insufficient value sent"); 
        participants.push(payable(msg.sender));
    }
   
    function getBalance() public view returns (uint) {
        require(msg.sender == manager, "Only manager can access balance");
        return address(this).balance;
    }

    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants.length)));
    }

    function selectWinner() public  returns (address) {
        require(msg.sender == manager, "Only manager can select winner");
        require(participants.length >= 3, "Not enough participants");
        
        uint r = random();
        uint index = r % participants.length;
        winner = participants[index];
        return winner;
    }
}
