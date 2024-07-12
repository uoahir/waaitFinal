package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Employee;

public interface ChattingDao {
	List<Employee> selectEmployeelist(SqlSession session);
}
