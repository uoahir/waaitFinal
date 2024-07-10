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
public class Message {

	private String type;	// open, msg, close 등
	
	private int empNo;	// 전송한 사원 사원번호
	private String empName;	//전송한 사원이름

	private int chatRoomNo;	// 채팅방 번호
	private String chatContent;		// 전송한 메세지
	private Date chatCreationDate;	//채팅작성 시간
	private int chatReadCount;	//채팅 읽, 안읽 숫자표시
	
	
}
