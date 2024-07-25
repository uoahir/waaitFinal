package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.dto.Message;

public interface ChattingDao {
	List<Employee> selectEmployeelist(SqlSession session);
	
	List<ChatRoom> selectChatRoomlist(SqlSession session, long loginEmpNo);
	
	ChatRoom selectChatRoomName(SqlSession session, Map<String, Integer> param);
	
	List<ChatHistory> selectChatRoomHistory(SqlSession session, Map<String, Integer> param);
	
	int insertChatHistory(SqlSession session, Message message);
	
	int insertChatRoom(SqlSession session, Map<String, Object> chatRoomParam);
	
	int selectSEQ_ChatRoomNo(SqlSession session);
	
	int insertChatJoin(SqlSession session, Map<String, Object> chatJoinParam);
	
	List<Employee> selectChatEmployeelist(SqlSession session, int chatroomNo);

	List<Employee> selectChatEmployeelistnot(SqlSession session, int chatroomNo);
}
