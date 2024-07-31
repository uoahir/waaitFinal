package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.TodayWork;
import com.waait.dto.Work;

public interface WorkDao {

	int insertWorkStart(SqlSession sqlSession, Work work);

	Work selectByEmpNoWork(SqlSession sqlSession, Map<String, String> param);

	int insertLeaveWork(SqlSession sqlSession, Map<String, Object> map);

	List<Work> selectTodayAllWorkList(SqlSession sqlSession, String today);

	List<Long> selectAllNo(SqlSession sqlSession, String today);

	int insertDateStatus(SqlSession sqlSession, TodayWork t);

	

}
