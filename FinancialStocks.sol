// SPDX-License-Identifier: SOFIA
pragma solidity ^0.8.0;

contract FinancialStocks{
    uint var1;
    uint var2;
    uint var3;
    uint public interestPerYear;
    uint public totalInterest;
    uint public principalInterest;
    string public fullname;

    constructor(string memory name){
      fullname = name;

    }

    function ComputeInterest(uint principal, uint instrument, uint year) public {
        var1 = principal;
        var2 = instrument;
        var3 = year;
        require(var2 >= 1 && var2 <= 3, "Instruments should only be 1 to 3.");
        uint[3] memory interestRates = [uint(12), uint(4*2), uint(10*2)];

        for (uint i = 1; i <= 3; i++) {
            if (var2 == i) {
                interestPerYear = (principal * interestRates[i-1]) / 100;
                totalInterest = year * interestPerYear;
                principalInterest = principal + totalInterest;
                break;
            }
        }

        
    }
}
