package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

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

	public Employee searchEmpForModifyDepartment(Map<String, String> searchParam) {
		return dao.searchEmpForModifyDepartment(session, searchParam);
	}

	public int modifyEmployeeDept(Map<String, String> modifyParam) {
		return dao.modifyEmployeeDept(session, modifyParam);
	}
}
