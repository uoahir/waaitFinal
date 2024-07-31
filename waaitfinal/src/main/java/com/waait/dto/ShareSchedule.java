package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareSchedule {
	private int scheNo;
	private int empNo;	
	private String deptCode;
}
