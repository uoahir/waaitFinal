package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Employee;
import com.waait.dto.Mypage;

public interface MypageDao {

//	int updateEmpPwd(SqlSession session,Employee e);
	List<Mypage>myInfoList(SqlSession session, long empNumber);
}
