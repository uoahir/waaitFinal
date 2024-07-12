package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;
import com.waait.dto.Employee;

@Repository
public class JsTreeDaoImpl implements JsTreeDao {

	@Override
	public List<Department> getTreeDeptData(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("jstree.getTreeDeptData");
	}

	@Override
	public List<Employee> getTreeEmpData(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("jstree.getTreeEmpData");
	}

}
