package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Override
	public List<Employee> selectEmployeelist(SqlSession session) {
		return session.selectList("chatting.selectEmployeelist");
	}

	@Override
	public List<ChatRoom> selectChatRoomlist(SqlSession session, long loginEmpNo) {
		return session.selectList("chatting.selectChatRoomlist",loginEmpNo);
	}

	
	
	
	
}
