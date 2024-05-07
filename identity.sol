
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract  IIdentity{
    string name;
    uint age;

    constructor(){
        name="ravi";
        age=17;
    }

    function getname() view  public  returns (string memory){
        return  name;
    }

    function getage() view public returns (uint){
         return age;
    }

    function ageinc() public {
        age=age+1;
    }
}
