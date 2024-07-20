package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Schedule;

public interface ScheduleService {
	
	// 내 일정 리스트로 출력
	List<Schedule> scheduleList(long empNumber);	
	
	// 일정 db에 추가하기 
	int insertSchedule(Schedule s);
	
	//일정 수정하기
	int updateSchedule(Schedule s);

	
}
