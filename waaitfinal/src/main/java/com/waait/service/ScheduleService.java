package com.waait.service;

import java.util.List;

import com.waait.dto.Schedule;

public interface ScheduleService {

	//리스트로 뽑아오는 메소드
	List<Schedule> selectByempNo(Schedule s); 
	
}
