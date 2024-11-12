// SPDX-License-Identifier: SOFIA
pragma solidity ^0.8.26;

contract KaccekHash
{
    string public _Name1 = "Name1";
    string public _Name2 = "Name2";

    //NOTE THE HASH CHANGES COMPLETELY DEPENDING ON THE UINT (EX. UINT16 SHOWS A DIFFERENT HASH THAN UINT32)
    function Compute(string memory first, string memory middle, string memory last, string memory gender, uint age) public pure returns (bytes32){
        bytes1 a = bytes(first)[0];
        bytes1 b = bytes(middle)[bytes(middle).length - 1];
        bytes1 c = bytes(last)[bytes(last).length - 1];
        bytes1 d = bytes(gender)[0];
        bytes1 e = bytes(abi.encodePacked(age))[0];
        string memory combine = string(abi.encodePacked(a,b,c,d,e));
        bytes32 hash = keccak256((abi.encodePacked(combine, uint(3))));
        
        return hash;
    }
}