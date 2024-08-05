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
	List<SpamDomain> getSpamDomain(SqlSession session, long empNo);
	int getNotReadMailCount(SqlSession session, Map<String, Object> sqlParam);
}
