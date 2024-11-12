// SPDX-License-Identifier: SOFIA
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GradesNFT is ERC1155, Ownable {
    uint256 public constant EXCELLENT = 1;
    uint256 public constant VERYGOOD = 2;
    uint256 public constant GOOD = 3;
    uint256 public constant FAIR = 4;
    uint256 public constant POOR = 5;
    mapping(uint256 => string) public gradeID;


    constructor() ERC1155("https://mygame.io/api/item/{id}.json") Ownable (msg.sender){
        gradeID[EXCELLENT] = "Excellent";
        gradeID[VERYGOOD] = "Very Good";
        gradeID[GOOD] = "Good";
        gradeID[FAIR] = "Fair";
        gradeID[POOR] = "Poor";
    }

    function gradeScore(address to, uint256 score) external onlyOwner{
        uint256 grade;
 
        if (score >= 91 && score <= 100){
            grade = EXCELLENT;
        }
        else if (score >= 81 && score <= 90){
            grade = VERYGOOD;
        }
        else if (score >= 75 && score <= 80){
            grade = GOOD;
        }
        else if (score >= 71 && score <= 74){
            grade = FAIR;
        }
        else {
            grade = POOR;
        }
        _mint(to, grade, 1, "");
    }
    function getGrades(uint256 studentTokenID) public view returns (string memory){
        return gradeID[studentTokenID];
    }
}