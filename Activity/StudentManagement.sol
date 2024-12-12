// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract StudentManagement{

    enum Department { CS, EC, ME }
    address public staffAdvisor;

    struct Student{
      string name;
      uint256 sem;
      Department dept;
      uint256 CGPA;
      uint256 rollno;
      bool exist;
    }

    mapping(uint256 => Student) private studentDetails;

     
    constructor() {
        staffAdvisor = msg.sender;
    }

    modifier admin(){
        require(msg.sender == staffAdvisor,"Unauthorised Access");
        _;
    }
    modifier VerifyStud(uint256 rollno){
        require(studentDetails[rollno].exist,"Roll Number does not exist");
        _;
    }

    function addStudent(string memory _name,uint256 _sem,Department _dept,uint256 _CGPA,uint256 _rollno) public  admin {
            
            require(!studentDetails[_rollno].exist, "Roll number is already exist");
            studentDetails[_rollno] = Student(_name,_sem,_dept,_CGPA,_rollno,true);
    }

     function getStudent(uint256 _rollno) public view admin returns (string memory name, uint256 sem, Department dept, uint256 CGPA, uint256 rollno) {
        
        Student memory student = studentDetails[_rollno];
        return (student.name, student.sem, student.dept, student.CGPA, student.rollno);
    }

    function editData(uint256 _sem,Department _dept,uint256 _CGPA,uint256 _rollno) public admin VerifyStud(_rollno){

                Student storage student = studentDetails[_rollno];
                student.sem= _sem;
                student.dept = _dept;
                student.CGPA = _CGPA; 
    }

    function editName(string memory _name,uint256 _rollno) public VerifyStud(_rollno){

                Student storage student = studentDetails[_rollno];
                student.name= _name;
               
    }




}