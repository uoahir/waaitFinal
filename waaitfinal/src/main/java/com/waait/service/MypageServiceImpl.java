package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MypageDao;
import com.waait.dto.Mypage;
import com.waait.dto.SpamDomain;
import com.waait.dto.Work;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageServiceImpl implements MypageService {
	

	private final MypageDao dao;
	private final SqlSession session;
			
	@Override
	public List<Mypage> myInfoList(Long empNumber) {
		return dao.myInfoList(session,empNumber);
	}

	@Override
	public List<Mypage> myVacation(Long empNumber) {
		return dao.myVacation(session,empNumber);
	}

	@Override
	public List<Work> myTodayWork(Long empNumber) {
		return dao.myTodayWork(session,empNumber);
	}


	//메인페이지 안읽은 메시지수 출력
	@Override
	public int selectChatHistoryCount(Long loginEmpNo) {
		int chatCount = dao.selectChatHistoryCount(session, loginEmpNo);
		return chatCount;
	}

	
	

	@Override
	public List<SpamDomain> getSpamDomain(long empNo) {
		return dao.getSpamDomain(session, empNo);
	}

	@Override
	public int getNotReadMailCount(Map<String, Object> sqlParam) {
		return dao.getNotReadMailCount(session, sqlParam);
	}

	

	
	
	
	

}
