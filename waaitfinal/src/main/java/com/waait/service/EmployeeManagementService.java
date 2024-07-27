package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.EmployeeManagementDao;
import com.waait.dto.Department;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeManagementService {
	
	private final EmployeeManagementDao dao;
	private final SqlSession session;
			
	public List<Department> getDepartment() {
		return dao.getDepartment(session);
	}

	public List<Employee> getEmployees() {
		return dao.getEmployees(session);
	}
	
	public Employee getEmployeeById(String empId) {
		return dao.getEmployeeById(session, empId);
	}

	public Employee searchEmpForModifyDepartment(Map<String, String> searchParam) {
		return dao.searchEmpForModifyDepartment(session, searchParam);
	}
	
	@Transactional
	public int modifyEmployeeDept(Map<String, Object> modifyParam) {
		int result = 0;
		result = dao.modifyEmployeeDept(session, modifyParam);
		result = dao.insertMovingDepartment(session, modifyParam);
		return result;
	}

}
