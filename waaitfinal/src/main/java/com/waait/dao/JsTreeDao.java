package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Department;
import com.waait.dto.Employee;

public interface JsTreeDao {
//	jsTree 출력을 위한 메소드
	List<Department> getTreeDeptData(SqlSession session);
	List<Employee> getTreeEmpData(SqlSession session);
}
