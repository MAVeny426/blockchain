//SPDX-License-Identifier:MIT
pragma solidity 0.8.28;
contract MathFunctions{
    int public largestNumber;
    string public digitInWord;
    string public signOfNumber;

    function findLargest(int num1,int num2,int num3) public{
        if (num1 >= num2 && num1 >= num3) {
        largestNumber = num1;
        } else if (num2 >= num1 && num2 >= num3) {
        largestNumber = num2;
        } else {
        largestNumber = num3;
        }
    }

    function getDigit(int num) public {
        if (num >= 0 && num <= 9) {
            if (num == 0) digitInWord = "zero";
            else if (num == 1) digitInWord = "one";
            else if (num == 2) digitInWord = "two";
            else if (num == 3) digitInWord = "three";
            else if (num == 4) digitInWord = "four";
            else if (num == 5) digitInWord = "five";
            else if (num == 6) digitInWord = "six";
            else if (num == 7) digitInWord = "seven";
            else if (num == 8) digitInWord = "eight";
            else if (num == 9) digitInWord = "nine";
        } else {
            digitInWord = "invalid Input"; 
        }
    }

     function checkSign(int num) public {
        if (num > 0) {
            signOfNumber = "positive";
        } else if (num < 0) {
            signOfNumber = "negative";
        } else {
            signOfNumber = "zero";
        }
    }
}