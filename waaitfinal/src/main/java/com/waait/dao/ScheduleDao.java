package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Schedule;

public interface ScheduleDao {

	List<Schedule>selectByempNo(SqlSession session,Schedule s);
	
}
