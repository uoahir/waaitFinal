package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Schedule;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ScheduleDaoImpl implements ScheduleDao {
	
	private final SqlSession session;
	
	@Override
	public List<Schedule> selectByempNo(SqlSession session,Schedule s) {
		return session.selectList("schedule.selectByempNo", s);
	}
	
	

}
