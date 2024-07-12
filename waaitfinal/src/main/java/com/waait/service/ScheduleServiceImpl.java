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
	
	private final ScheduleDao dao;
	private final SqlSession session;
			
	@Override
	public List<Schedule> scheduleList(long empNumber) {
		return dao.scheduleList(session,empNumber);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return dao.insertSchedule(session,schedule);
	}
	
	
	
	
	
	

}
