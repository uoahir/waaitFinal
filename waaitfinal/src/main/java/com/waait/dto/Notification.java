package com.waait.dto;

import java.time.LocalDateTime;

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
	
	private int readCheck; // 안읽음 0, 읽음 1 
		
	private LocalDateTime createdAt;
	
}
