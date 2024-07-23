package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;

public interface ChattingDao {
	List<Employee> selectEmployeelist(SqlSession session);
	
	List<ChatRoom> selectChatRoomlist(SqlSession session, long loginEmpNo);
	
	ChatRoom selectChatRoomName(SqlSession session, Map<String, Integer> param);
	
	List<ChatHistory> selectChatRoomHistory(SqlSession session, Map<String, Integer> param);
}
