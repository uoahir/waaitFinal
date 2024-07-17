package com.waait.service;

import java.util.List;

import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;

public interface ChattingService {

	List<Employee> selectEmployeelist();
	
	List<ChatRoom> selectChatRoomlist(long loginEmpNo);
	
}
