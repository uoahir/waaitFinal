package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;
import com.waait.dto.Employee;

@Repository
public class EmployeeManagementDao {

	public List<Department> getDepartment(SqlSession session) {
		return session.selectList("em.getDepartment");
	}

	public List<Employee> getEmployees(SqlSession session) {
		return session.selectList("em.getEmployees");
	}
	
	public Employee getEmployeeById(SqlSession session, String empId) {
		return session.selectOne("em.getEmployeeById", empId);
	}

	public Employee searchEmpForModifyDepartment(SqlSession session, Map<String, String> searchParam) {
		return session.selectOne("em.searchEmpForModifyDepartment", searchParam);
	}

	public int modifyEmployeeDept(SqlSession session, Map<String, Object> modifyParam) {
		return session.update("em.modifyEmployeeDept", modifyParam);
	}

	public int insertMovingDepartment(SqlSession session, Map<String, Object> modifyParam) {
		return session.insert("em.insertMovingDepartment", modifyParam);
	}


}
