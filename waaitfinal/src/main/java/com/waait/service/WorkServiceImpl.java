package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.WorkDao;
import com.waait.dto.TodayWork;
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
	@Override
	public int insertLeaveWork(Map<String, Object> map) {
		int rs = workDao.insertLeaveWork(sqlSession,map);
		return rs;
	}
	@Override
	public List<Work> selectTodayAllWorkList(String today) {
		List<Work> workList =workDao.selectTodayAllWorkList(sqlSession,today);
		return workList;
	}
	@Override
	public List<Long> selectAllNo(String today) {
		List<Long> workList = workDao.selectAllNo(sqlSession,today);//연차 유무 
		return workList;
	}
	@Override
	public int insertDateStatus(List<TodayWork> todayworkList) {
		for(TodayWork t : todayworkList) {
			int rs = workDao.insertDateStatus(sqlSession,t);	
		}
		
		return 0;
	}

	

}
