package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Document;
import com.waait.dto.Employee;

@Repository
public class EDocDaoImpl implements EDocDao {

	@Override
	public int insertDoc(SqlSession session, Document doc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Employee> employeeList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.employeelist");
	}

	
}
