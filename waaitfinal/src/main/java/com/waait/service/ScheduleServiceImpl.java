package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.ScheduleDao;
import com.waait.dto.Schedule;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ScheduleServiceImpl implements ScheduleService {
	
//	private final Schedule s;
	private final ScheduleDao dao;
	private final SqlSession session;
	
//	@Override
//	public List<Schedule> selectByempNo(Schedule s) {
//		return dao.selectByempNo(session,s);
//	}
		
	@Override
	public List<Schedule> scheduleList(Schedule empNo) {
		return dao.scheduleList(session,empNo);
	}
	
	
	
	
	

}
