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
	public int insertChatHistory(SqlSession session, Message message) {
		return session.insert("chatting.insertChatHistory",message);
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
	
	
	
	
	
	
	
}
