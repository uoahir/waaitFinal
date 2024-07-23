package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.ChattingDao;
import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChattingServiceImpl implements ChattingService {

	private final SqlSession session;
	private final ChattingDao dao;
	
	
	@Override
	public List<Employee> selectEmployeelist() {
		List<Employee> employees = dao.selectEmployeelist(session);
		return employees;
	}


	@Override
	public List<ChatRoom> selectChatRoomlist(long loginEmpNo) {
		List<ChatRoom> chatRooms = dao.selectChatRoomlist(session, loginEmpNo);
		return chatRooms;
	}


	@Override
	public ChatRoom selectChatRoomName(Map<String, Integer> param) {
		ChatRoom chatName = dao.selectChatRoomName(session, param);
		return chatName;
	}


	@Override
	public List<ChatHistory> selectChatRoomHistory(Map<String, Integer> param) {
		List<ChatHistory> chatHistorys = dao.selectChatRoomHistory(session, param);
		return chatHistorys;
	}
	
	
	
	
	
	
	
}
