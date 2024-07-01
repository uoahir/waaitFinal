package com.waait.dao;

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

}
