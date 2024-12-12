//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract  Bank{
    mapping (address => uint) balanceLedger;

    address public admin;
    constructor(){
        admin=msg.sender;
    }

    modifier balanceCheck(uint amt){
        require(balanceLedger[msg.sender] >= amt,"Insufficient Balance");
        _;
    }

    function deposit() public payable {
        balanceLedger[msg.sender] = balanceLedger [msg.sender] + msg.value;
    }

    function getBalance() public view returns(uint){
        return balanceLedger[msg.sender];
    }

    function withdraw(uint amt) public {
        // require(balanceLedger[msg.sender] >= amt,"Insufficent Balance");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - amt;
        payable (msg.sender).transfer(amt);
    } 
    function tranfer(uint tamt,address reciver) public {
        // require(balanceLedger[msg.sender] >= tamt,"Insufficent Balance");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - tamt;
        payable (reciver).transfer(tamt);
    }
}