package com.waait.service;

import java.util.List;

import com.waait.dto.Employee;
import com.waait.dto.Mypage;

public interface MypageService {
	
	//사원 정보 불러오기
	List<Mypage> myInfoList(Long empNumber);
	//총 연차,잔여연차 출력
	List<Mypage> myVacation(Long empNumber);
	//사원 출퇴근시간 불러오기 
	List<Mypage> myTodayWork(Long empNumber);
	
}
