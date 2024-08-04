package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Employee;
@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	
	public int insertEmployee(SqlSession session, Employee employee) {
		return session.insert("employee.insertEmployee",employee); //값 입력
	}

	@Override
	public Employee selectEmployee(SqlSession session, String empId) {
		return session.selectOne("employee.selectEmployee",empId);
	}

	@Override
	public List<Employee> selectAllEmployees(SqlSession session) {
		
		return session.selectList("employee.selectAllEmployees");
	}

	@Override
	public Employee selectByEmpNo(SqlSession session, int no) {
		
		return session.selectOne("employee.selectByEmpNo",no);
	}

}
