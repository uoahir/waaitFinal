package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification {
	
	private Long notiId; 
	
	private Long receiver; // empId or Employee 
	
	private String message;
	
	private boolean read;
	
	private String lastEventId; // emitter 생성 시, emitter를 구분해주는 id 값을 여기에 넣어주기 !
	
}
