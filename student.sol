//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

contract StudentData{
	struct Student
	{
		uint id;
		string name;
		uint age;
	}
	
	Student[] private students;
	uint public totalReceivedEther;
	
	event StudentAdded(uint id,string name,uint age);
	event EtherReceived(address indexed sender,uint value);

	receive() external payable{
		emit EtherReceived(msg.sender,msg.value);
		totalReceivedEther+=msg.value;
	}

	function addStudent(uint _id,string memory _name,uint _age) public
	{
		students.push(Student(_id,_name,_age));
		emit StudentAdded(_id,_name,_age);
	}
	
	function getStudentCount() public view returns(uint256){
		return students.length;
	}

	function getStudent(uint index) public view returns(uint,string memory,uint)
	{
		require(index<students.length,"Index out of bound");
		Student memory student=students[index];
		return(student.id,student.name,student.age);
	}
}