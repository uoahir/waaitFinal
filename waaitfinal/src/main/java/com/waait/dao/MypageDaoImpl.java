package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mypage;
import com.waait.dto.Work;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MypageDaoImpl implements MypageDao {
	

	private SqlSession session;
	
	@Override
	public List<Mypage> myInfoList(SqlSession session, long empNumber) {
		return session.selectList("mypage.myInfoList",empNumber);
	}

	@Override
	public List<Mypage> myVacation(SqlSession session, long empNumber) {
		return session.selectList("mypage.myVacation",empNumber);
	}

	@Override
	public List<Work> myTodayWork(SqlSession session, long empNumber) {
		return session.selectList("mypage.myTodayWork",empNumber);
	}

	//메인페이지 안읽은 메세지 수 출력
	@Override
	public int selectChatHistoryCount(SqlSession session, Long empNo) {
		return session.selectOne("mypage.selectChatHistoryCount",empNo);
	}
	
	
	
	
	
	

	
	
	
	

}
