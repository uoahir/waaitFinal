package com.waait.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatRoom {

	private int chatRoomNo;	//채팅방번호
	private String chatRoomType;	//일대일 그룹 오픈
	private int chatRoomEmpNo;	//개설자 사원 번호
	private Date chatRoomCreationDate;	//채팅방 생성날짜
	private String chatRoomName;	//채팅방 이름
	private String chatRoomPassword;	//채팅방 비밀번호
	private String chatRoomIntroduction;	//채팅방 소개글
	
	//employee테이블	chatHistory안에 넣었음
//	private String empName;
//	private String empProfile;
	
	//채팅기록 
	private ChatHistory chatHistory;
	
	//채팅조인 카운트 자기포함한 카운트 -1 해서 사용해야됨.
	private int chatJoinCount;
	
	// 1:1채팅방일때 상대방 사원이름
	private String chatEmpName;
}
