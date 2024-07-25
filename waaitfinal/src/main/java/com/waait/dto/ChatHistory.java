package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatHistory {

	private int chatHistoryNo;	//채팅 pk키
	private int chatRoomNo;	//채팅 해당하는 채팅방 번호
	private int empNo;	//채팅작성자번호
	private String chatContent;	//채팅내용
	private String chatCreationDate;	//채팅작성 날짜
	private int chatReadCount;	//채팅 읽 안읽
	
	//Employee
	private String empName;
	private String empProfile;
	
	//개인톡방일떄 사용
	private String chatEmpName;
	
	//chatRoomName -> empName -> chatEmpName
	// 채팅방이름 -> (그룹)개설자이름 -> (개인)상대방이름
	
	
}
