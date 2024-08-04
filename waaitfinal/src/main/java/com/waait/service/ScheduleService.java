package com.waait.service;

import java.util.List;

import com.waait.dto.Schedule;
import com.waait.dto.ShareSchedule;

public interface ScheduleService {
	
	// 내 일정 리스트로 출력
	List<Schedule> scheduleList(long empNumber);		
	// 일정 db에 추가하기 
	int insertSchedule(Schedule s);	
	//일정 수정하기
	int updateSchedule(Schedule s);
	//일정 삭제하기
	int deleteSchedule(int num);
	//그룹일정 리스트에 출력 받아오기
//	List<ShareSchedule> shareScheduleList(long empNumber); 
	//팀캘린더 출력하기 
	List<Schedule> teamSchedule(String deptCode);
	

	
}
