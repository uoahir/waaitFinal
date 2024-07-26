package com.waait.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Work;

@Repository
public class WorkDaoImpl implements WorkDao{

	@Override
	public Work selectByEmpNoWork(SqlSession sqlSession, Map<String, String> param) {
		
		return sqlSession.selectOne("work.selectByEmpNoWork",param);
	}

	@Override
	public int insertWorkStart(SqlSession sqlSession, Work work) {
		
		return sqlSession.insert("work.insertWorkStart",work);
	}

	@Override
	public int insertLeaveWork(SqlSession sqlSession, Map<String, Object> map) {		
		return sqlSession.update("work.insertLeaveWork",map);
	}
	
}
