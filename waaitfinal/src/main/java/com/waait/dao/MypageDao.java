package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Mypage;
import com.waait.dto.Work;

public interface MypageDao {

	List<Mypage>myInfoList(SqlSession session, long empNumber);
	List<Mypage>myVacation(SqlSession session,long empNumber);
	List<Work> myTodayWork(SqlSession session,long empNumber);
	int selectChatHistoryCount(SqlSession session, Long empNo);
}
