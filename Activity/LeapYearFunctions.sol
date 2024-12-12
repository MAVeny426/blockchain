//Write a smart contract that accepts a year as an input and determines whether it is a leap year. 
//Also include the necessary logic to verify whether the input is a valid 4 digit number.

//SPDX-License-Identifier:MIT
pragma solidity 0.8.28;
contract LeapYearFunctions {

    function isLeapYear(uint16 year) public pure returns (string memory) {

        if (year < 1000 || year > 9999) {
            return "Invalid input! Please enter a 4-digit year.";
        }
        if (year % 4 == 0) {
            if (year % 100 != 0 || year % 400 == 0) {
                return "Leap Year"; 
            } else {
                return "Not a Leap Year";
            }
        } else {
            return "Not a Leap Year";
        }
    }
}