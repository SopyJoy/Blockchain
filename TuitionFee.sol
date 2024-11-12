// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract School{
    string public fullname;
    uint public numUni;
    uint public rateUni;
    uint public labfee;
    uint public mop;
    uint public enrollmentfee;
    uint public miscellaneous;
    uint public tuitionfee;
    uint public totalPayment;
    string message;


    constructor(string memory name){
      fullname = name;

    }

    function computeValues(uint var1, uint var2, uint var3, uint var4)public{
        numUni = var1;
        rateUni = var2;
        labfee = var3;
        mop = var4;
        if (var4 == 1){
            enrollmentfee = var1*var2;
            if (var2 > 18){
                miscellaneous = (enrollmentfee*12)/100;
                tuitionfee = enrollmentfee + miscellaneous+var3;
                totalPayment = (tuitionfee*10)/100;
            }else{
                miscellaneous = (enrollmentfee*8)/100;
                tuitionfee = enrollmentfee + miscellaneous+var3;
                totalPayment = (tuitionfee*10)/100;
            }

        }else if (var4 == 2){
            enrollmentfee = var1*var2;
            if (var2 > 18){
                miscellaneous = (enrollmentfee*12)/100;
                tuitionfee = enrollmentfee + miscellaneous+var3;
                totalPayment = (tuitionfee*5)/100;
            }else{
                miscellaneous = (enrollmentfee*8)/100;
                tuitionfee = enrollmentfee + miscellaneous+var3;
                totalPayment = (tuitionfee*5)/100;
            }
        }else{
            message = "No SCOPE";
        }

        
    }

}
