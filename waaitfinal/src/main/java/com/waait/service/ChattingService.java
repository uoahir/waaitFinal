package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.dto.Message;

public interface ChattingService {

	List<Employee> selectEmployeelist();
	
	List<ChatRoom> selectChatRoomlist(long loginEmpNo);
	
	ChatRoom selectChatRoomName(Map<String, Integer> param);
	
	List<ChatHistory> selectChatRoomHistory(Map<String, Integer> param);
	
	int insertChatHistory(List<Message> messages);
	
	int insertChatRoom(Map<String, Object> chatRoomParam);
	
	int insertChatJoin(List<Long> chatJoinParam);
	
	Map<String, Object> selectChatEmployeelist(int chatroomNo);
	
	void insertChatJoinInvite(Map<String, Object> param);
	
	void deleteChatJoin(Map<String, Object> param);
}
