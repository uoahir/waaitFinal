package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovingDepartment{
	private int movingDepartmentNo;
	private int empNo;
	private String previousDept;
	private String nextDept;
	private String previousTeam;
	private String nextTeam;
	private String modifyDate;
	private Employee employee;
}
