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
	public ChatRoom selectChatRoomName(SqlSession session, Map<String, Number> param) {
		return session.selectOne("chatting.selectChatRoomName",param);
	}

	@Override
	public List<ChatHistory> selectChatRoomHistory(SqlSession session, Map<String, Number> param) {
		return session.selectList("chatting.selectChatRoomHistory",param);
	}

	@Override
	public int insertChatHistory(SqlSession session, Message msg) {
		return session.insert("chatting.insertChatHistory",msg);
	}
	

	@Override
	public int insertChatRoom(SqlSession session, Map<String, Object> chatRoomParam) {
		return session.insert("chatting.insertChatRoom",chatRoomParam);
	}
 
	//최근 방 시퀀스값 가져오기
	@Override
	public int selectSEQ_ChatRoomNo(SqlSession session) {
		return session.selectOne("chatting.selectSEQ_ChatRoomNo");
	}

	@Override
	public int insertChatJoin(SqlSession session, Map<String, Object> chatJoinParam) {
		return session.insert("chatting.insertChatJoin",chatJoinParam);
	}

	@Override
	public List<Employee> selectChatEmployeelist(SqlSession session, int chatroomNo) {
		return session.selectList("chatting.selectChatEmployeelist",chatroomNo);
	}

	@Override
	public List<Employee> selectChatEmployeelistnot(SqlSession session, int chatroomNo) {
		return session.selectList("chatting.selectChatEmployeelistnot",chatroomNo);
	}

	@Override
	public int deleteChatJoin(SqlSession session, Map<String, Object> param) {
		return session.delete("chatting.deleteChatJoin",param);
	}

	@Override
	public Employee selectEmpProfile(SqlSession session, Long empNo) {
		return session.selectOne("chatting.selectEmpProfile",empNo);
	}

	@Override
	public Integer selectProfilechatOpen(SqlSession session, Map<String, Object> param) {
		System.out.println("다오 : "+param);
		return session.selectOne("chatting.selectProfilechatOpen",param);
	}

	@Override
	public List<Long> selectChatJoin(SqlSession session, Map<String ,Number> param) {
		return session.selectList("chatting.selectChatJoin",param);
	}

	@Override
	public int insertChatHistoryCount(SqlSession session, Map<String, Number> param) {
		return session.insert("chatting.insertChatHistoryCount",param);
	}

	@Override
	public int deleteChatHistoryCount(SqlSession session, Map<String, Number> param) {
		return session.delete("chatting.deleteChatHistoryCount",param);
	}

	//chatHistory 초대하기 할때 사원들 이름 불러오기
	@Override
	public String selectChatHistoryInvitation(SqlSession session, Long empNo) {
		return session.selectOne("chatting.selectChatHistoryInvitation",empNo);
	}
	
	//초대하기 chatHistory에 추가하기
	@Override
	public int insertChatHistoryLeaveInvitation(SqlSession session, Map<String, Object> param) {
		return session.insert("chatting.insertChatHistoryLeaveInvitation",param);
	}
	
	
	
	
	
	
	
	
}
