package com.waait.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.WorkDao;
import com.waait.dto.Work;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorkServiceImpl implements WorkService{
	
	private final SqlSession sqlSession;
	private final WorkDao workDao;
	@Override
	public int insertWorkStart(Work work) {
		int rs =workDao.insertWorkStart(sqlSession,work);
		return rs;
	}
	@Override
	public Work selectByEmpNoWork(Map<String, String> param) {
		Work work = workDao.selectByEmpNoWork(sqlSession,param);
		return work;
	}
	

}
