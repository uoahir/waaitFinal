package com.waait.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Work;

public interface WorkDao {

	int insertWorkStart(SqlSession sqlSession, Work work);

	Work selectByEmpNoWork(SqlSession sqlSession, Map<String, String> param);

}
