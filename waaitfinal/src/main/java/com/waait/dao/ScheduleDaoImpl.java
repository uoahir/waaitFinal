package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Schedule;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ScheduleDaoImpl implements ScheduleDao {
	
	private final SqlSession session;


//	@Override
//	public List<Schedule> selectByempNo(SqlSession session,Schedule s) {
//		return session.selectList("schedule.selectByempNo", s);
//	}
	
//	@Override
//	public List<Schedule> selectList(SqlSession session, Map<String, Integer> page) {
//		return session.selectList("scheule.selectList", null,
//				new RowBounds ((page.get("cPage")-1)*page.get("numPerpage"),
//						page.get("numPerpage")));
//	}
	
	@Override
	public List<Schedule> scheduleList(SqlSession session, long empNumber) {
		return session.selectList("schedule.scheduleByempNo",empNumber);
	}


	@Override
	public int insertSchedule(SqlSession session, Schedule schedule) {
		return session.insert("schedule.insertschedule", schedule);
	}
	
	
	
	

}
