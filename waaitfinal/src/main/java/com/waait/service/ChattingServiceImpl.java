package com.waait.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.ChattingDao;
import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.dto.Message;

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


	@Override
	public int insertChatHistory(List<Message> messages) {
//		int result = dao.insertChatHistory(session, messages);
		int result = 0;
		for(Message message : messages) {
			result = dao.insertChatHistory(session, message);
		}
		return result;
	}


	@Override
	public int insertChatRoom(Map<String, Object> chatRoomParam) {
		System.out.println("6");
		int result = dao.insertChatRoom(session, chatRoomParam);
		System.out.println("result : "+result);
		return result;
	}


	
	@Override
	public int insertChatJoin(List<Long> chatJoinParam) {
		int chatRoomNo = dao.selectSEQ_ChatRoomNo(session);
		int result2 = 0;
		
		System.out.println("서비스 chatRoomNo : "+chatRoomNo);
		System.out.println("서비스 chatJoinParam : "+chatJoinParam);
//		List<Long> params = (List<Long>) chatJoinParam.get("chatEmpNo");
		
		for(Long chatEmpNo : chatJoinParam) {
			Map<String, Object> param = new HashMap<>();
			param.put("chatRoomNo", chatRoomNo);
			param.put("chatEmpNo", chatEmpNo);
			result2 = dao.insertChatJoin(session, param);
		}			
		
		System.out.println("서비스 result2 : "+result2);
		
		return chatRoomNo;
	}
	
	
	
	
	
	
	
}
