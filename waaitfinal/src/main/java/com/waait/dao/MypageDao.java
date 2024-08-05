package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Mypage;
import com.waait.dto.SpamDomain;
import com.waait.dto.Work;

public interface MypageDao {

	List<Mypage>myInfoList(SqlSession session, long empNumber);
	List<Mypage>myVacation(SqlSession session,long empNumber);
	List<Work> myTodayWork(SqlSession session,long empNumber);
	//안읽은 메세지수 출력
	int selectChatHistoryCount(SqlSession session, Long loginEmpNo);
	//안읽은 메일 출력
	List<SpamDomain> getSpamDomain(SqlSession session, long empNo);
	int getNotReadMailCount(SqlSession session, Map<String, Object> sqlParam);

}
