package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovingDepartment {
	private int movingDepartmentNo;
	private int empNo;
	private String previouseDept;
	private String nextDept;
	private String previouseTeam;
	private String nextTeam;
}
