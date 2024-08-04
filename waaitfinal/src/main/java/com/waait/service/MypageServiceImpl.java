package com.waait.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MypageDao;
import com.waait.dto.Mypage;
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
	public Work myTodayWork(Long empNumber) {
		return dao.myTodayWork(session,empNumber);
	}
	

	
	
	
	

}
