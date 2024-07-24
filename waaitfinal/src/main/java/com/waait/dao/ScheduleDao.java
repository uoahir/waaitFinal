package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Schedule;

public interface ScheduleDao {
	
	//내 일정 리스트로 출력
	List<Schedule> scheduleList(SqlSession session,long empNumber);		
	int insertSchedule(SqlSession session,Schedule s);	
	//일정 수정하기
	int updateSchedule(SqlSession session,Schedule s);
	//일정 삭제하기
	int deleteSchedule(SqlSession session, int num);
	
}


