package com.waait.service;

import com.waait.dto.Employee;

public interface EmployeeService {

	int insertEmployee(Employee employee);
	Employee selectEmployee(String empId);
}
