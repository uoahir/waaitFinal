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
	
	ChatRoom selectChatRoomName(Map<String, Number> param);
	
	List<ChatHistory> selectChatRoomHistory(Map<String, Number> param);
	
	int insertChatHistory(Message msg);
	
	int insertChatRoom(Map<String, Object> chatRoomParam);
	
	int insertChatJoin(List<Long> chatJoinParam);
	
	Map<String, Object> selectChatEmployeelist(int chatroomNo);
	
	void insertChatJoinInvite(Map<String, Object> param);
	
	void deleteChatJoin(Map<String, Object> param);
	
	Employee selectEmpProfile(Long empNo);
	
	Integer selectProfilechatOpen(Map<String, Object> param);
	
	int selectGetChatRoomNo();
	
	void insertChatHistoryCount(Map<String ,Number> param);
	
	void deleteChatHistoryCount(Map<String, Number> param);
	
	void insertChatHistoryInvitation(Map<String, Object> chParam);
	
	void insertChatHistoryLeave(Map<String, Object> chParam);
}
