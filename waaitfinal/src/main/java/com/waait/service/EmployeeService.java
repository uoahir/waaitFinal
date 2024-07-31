package com.waait.service;

import java.util.List;

import com.waait.dto.Employee;

public interface EmployeeService {

	int insertEmployee(Employee employee);
	Employee selectEmployee(String empId);
	List<Employee> selectAllEmployees();
	

}
