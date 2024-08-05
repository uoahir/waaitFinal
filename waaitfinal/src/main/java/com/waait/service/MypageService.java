package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Mypage;
import com.waait.dto.SpamDomain;
import com.waait.dto.Work;

public interface MypageService {
	
	//사원 정보 불러오기
	List<Mypage> myInfoList(Long empNumber);
	//총 연차,잔여연차 출력
	List<Mypage> myVacation(Long empNumber);
	//사원 출퇴근시간 불러오기 
	List<Work> myTodayWork(Long empNumber);
	
	List<SpamDomain> getSpamDomain(long empNo);
	
	int getNotReadMailCount(Map<String, Object> sqlParam);
	
}
