package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;

public interface ChattingService {

	List<Employee> selectEmployeelist();
	
	List<ChatRoom> selectChatRoomlist(long loginEmpNo);
	
	ChatRoom selectChatRoomName(Map<String, Integer> param);
	
	List<ChatHistory> selectChatRoomHistory(Map<String, Integer> param);
	
}
