package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.dto.Message;

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

	@Override
	public ChatRoom selectChatRoomName(SqlSession session, Map<String, Integer> param) {
		return session.selectOne("chatting.selectChatRoomName",param);
	}

	@Override
	public List<ChatHistory> selectChatRoomHistory(SqlSession session, Map<String, Integer> param) {
		return session.selectList("chatting.selectChatRoomHistory",param);
	}

	@Override
	public int insertChatHistory(SqlSession session, Message message) {
		return session.insert("chatting.insertChatHistory",message);
	}

	
	
	
	
}
