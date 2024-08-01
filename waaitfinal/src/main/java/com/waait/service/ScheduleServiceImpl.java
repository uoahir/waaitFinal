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
	public int insertSchedule(Schedule s) {
		return dao.insertSchedule(session,s);
	}

	@Override
	public int updateSchedule(Schedule s) {
		return dao.updateSchedule(session,s);
	}

	@Override
	public int deleteSchedule(int num) {
		return dao.deleteSchedule(session,num);
	}

	@Override
	public List<Schedule> teamSchedule(String deptCode) {
		return dao.teamSchedule(session,deptCode);
	}
	
	
	
	
}
