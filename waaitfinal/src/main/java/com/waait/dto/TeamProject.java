package com.waait.dto;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamProject {
	private int projectNo;
	private String projectName; //
	private String projectSummary; //프로젝트 내용
	private Date projectStartDate;
	private Date projectEndDate;
	private List<ProjectFunction> projectFunctionList; //기능 
	private List<Employee> projectEmployee; // 사원 
	private List<Allocation>allocationList; // 할당된부분
	private Employee employee;
	private Date enrolldate;//등록일자
	private String projectStatus;
}
