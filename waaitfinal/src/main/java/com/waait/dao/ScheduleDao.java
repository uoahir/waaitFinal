package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Schedule;

public interface ScheduleDao {

//	List<Schedule>selectByempNo(SqlSession session,Schedule s);
	
//	List<Schedule> selectList(SqlSession session,Map<String,Integer>page);
	
	List<Schedule> scheduleList(SqlSession session,long empNumber);
	
	int insertSchedule(SqlSession session,Schedule schedule);
}
