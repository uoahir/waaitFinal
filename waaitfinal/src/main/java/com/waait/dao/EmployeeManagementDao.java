package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;

@Repository
public class EmployeeManagementDao {

	public List<Department> getDepartment(SqlSession session) {
		return session.selectList("em.getDepartment");
	}

}
