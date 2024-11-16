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
	
	private Employee employee; // empId or Employee 
	
	private String message;
	
	private boolean read;
	
}
