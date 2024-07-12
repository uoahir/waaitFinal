package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

public interface EDocDao {
	int insertDoc(SqlSession session, Document doc);
	List<Employee> employeeList(SqlSession session);
	int insertEdocContent(SqlSession session, Document doc);
	List<Department> deptList(SqlSession session);
	
}