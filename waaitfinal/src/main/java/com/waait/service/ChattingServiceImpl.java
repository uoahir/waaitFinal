package com.waait.service;

import java.util.ArrayList;
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
		System.out.println("서비스 - 채팅방목록 : "+chatRooms);
		return chatRooms;
	}


	@Override
	public ChatRoom selectChatRoomName(Map<String, Number> param) {
		ChatRoom chatName = dao.selectChatRoomName(session, param);
		return chatName;
	}


	@Override
	public List<ChatHistory> selectChatRoomHistory(Map<String, Number> param) {
		List<ChatHistory> chatHistorys = dao.selectChatRoomHistory(session, param);
		return chatHistorys;
	}


	@Override
	public int insertChatHistory(Message msg) {
//		int result = dao.insertChatHistory(session, messages);
		int result = 0;
		//for(Message message : messages) {
		result = dao.insertChatHistory(session, msg);
		//}
		return result;
	}


	@Override
	public int insertChatRoom(Map<String, Object> chatRoomParam) {
		int result = dao.insertChatRoom(session, chatRoomParam);
		System.out.println("insertChatRoom - result : "+result);
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


	@Override
	public Map<String, Object> selectChatEmployeelist(int chatroomNo) {
		List<Employee> employees = dao.selectChatEmployeelist(session, chatroomNo);
		
		List<Employee> employeesnot = dao.selectChatEmployeelistnot(session, chatroomNo);
		
		Map<String, Object> employee = new HashMap<>();
		
		employee.put("employees", employees);
		employee.put("employeesnot", employeesnot);
		return employee;
	}


	@Override
	public void insertChatJoinInvite(Map<String, Object> param) {
	 	List<Long> chatEmpNos = (List<Long>) param.get("chatEmpNo");
		
	 	chatEmpNos.forEach(e->{
	 		Map<String, Object> chatParam = new HashMap<>();
	 		chatParam.put("chatRoomNo", param.get("chatRoomNo"));
	 		chatParam.put("chatEmpNo", e);
	 		dao.insertChatJoin(session, chatParam);
	 	});
	}


	@Override
	public void deleteChatJoin(Map<String, Object> param) {
		dao.deleteChatJoin(session, param);
	}


	@Override
	public Employee selectEmpProfile(Long empNo) {
		Employee employee = dao.selectEmpProfile(session, empNo);
		return employee;
	}


	@Override
	public Integer selectProfilechatOpen(Map<String, Object> param) {
		System.out.println("서비스 : "+param);
		Integer chatRoomNo = dao.selectProfilechatOpen(session, param);
		System.out.println("돌아오는 서비스 - chatRoomNo : "+chatRoomNo);
		return chatRoomNo;
	}


	@Override
	public int selectGetChatRoomNo() {
		int chatRoomNo = dao.selectSEQ_ChatRoomNo(session);
		return chatRoomNo;
	}


	@Override
	public void insertChatHistoryCount(Map<String ,Number> param) {
		System.out.println("서비스 - insertChatHistoryCount - param : "+param);
		List<Long> empNos = dao.selectChatJoin(session, param);
		int chatRoomNo = (int) param.get("chatRoomNo");
		System.out.println("서비스 - insertChatHistoryCount - empNos : "+empNos);
		
		empNos.forEach(e->{
			Map<String, Number> countParam = new HashMap<>();
			countParam.put("empNo", e);
			countParam.put("chatRoomNo",chatRoomNo);
			int result = dao.insertChatHistoryCount(session, countParam);
			if(result > 0) {
				System.out.println("채팅카운트 저장됨?");
			}else {
				System.out.println("채팅카운트 저장안됨?");
			}
		});
	}


	@Override
	public void deleteChatHistoryCount(Map<String, Number> param) {
		int result = dao.deleteChatHistoryCount(session, param);
		if(result > 0) {
			System.out.println("채팅 count 삭제성공");
		}else {
			System.out.println("채팅 count 삭제실패");
		}
	}


	//채팅방초대 했을때 저장할 메세지
	@Override
	public void insertChatHistoryInvitation(Map<String, Object> chParam) {
		List<Long> chatEmpNos = (List<Long>) chParam.get("chatEmpNo");
		String chatEmpName = "";
		
		for(Long empNo : chatEmpNos) {
			chatEmpName += dao.selectChatHistoryInvitation(session, empNo)+"님 ";
		}
		
		System.out.println("서비스 채팅방초대된 사원이름 : "+chatEmpName);
		
		Map<String, Object> param = new HashMap<>();
		// 시퀀스번호, 방번호, chatType(10000-초대 20000-나가기), 내용, DEFAULT, 1
		int chatRoomNo = (int) chParam.get("chatRoomNo");
		String loginEmpName = (String) chParam.get("loginEmpName");
		//초대 : 로그인된사원 님이 선택된 사원 님, 사원 님, 사원 님을 초대했습니다 -> chatHistory에  chatcontent 테이블에 채팅내용으로 추가
		String chatContent = loginEmpName +"님이 "+chatEmpName+"을 초대했습니다";
		
		param.put("chatRoomNo", chatRoomNo);
		param.put("chatType", 10000);
		param.put("chatContent", chatContent);
		
		dao.insertChatHistoryLeaveInvitation(session, param);
	}

	// 채팅방 나갔을때 저장할 메세지
	@Override
	public void insertChatHistoryLeave(Map<String, Object> chParam) {
		dao.insertChatHistoryLeaveInvitation(session, chParam);
	}
	
	
	
	
	
	
	
	
	
	
}
