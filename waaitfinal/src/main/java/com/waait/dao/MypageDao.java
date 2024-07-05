package com.waait.dao;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Employee;

public interface MypageDao {

	int updateEmpPwd(SqlSession session,Employee e);
	
}
