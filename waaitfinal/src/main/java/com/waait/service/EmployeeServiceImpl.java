package com.waait.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.EmployeeDao;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{

	private final SqlSession session;
	private final EmployeeDao employeeDao;
	@Override
	public int insertEmployee(Employee employee) {
	int result = employeeDao.insertEmployee(session, employee);				
		return result;
	}
	@Override
	public Employee selectEmployee(String empId) {
	 Employee employee = employeeDao.selectEmployee(session, empId);
		return employee;
	}
	@Override
	public List<Employee> selectAllEmployees() {
		List<Employee> employees = employeeDao.selectAllEmployees(session); 
		return employees;
	}
	@Override
	public Employee selectByEmpNo(int no) {
		Employee employee =employeeDao.selectByEmpNo(session,no);
		return employee;
	}

	
}
