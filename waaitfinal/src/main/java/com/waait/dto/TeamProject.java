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
	private String projectName; //프로젝트이름
	private String projectSummary; //프로젝트 내용
	private Date projectStartDate;
	private Date projectEndDate;
	private List<Employee> projectEmployee; // 사원 request넣어줘야함
	private List<Allocation>allocationList; // 할당된부분
	private Employee employee; // 프로젝트 매니저 
	private Date enrolldate;//등록일자
	private String projectStatus; // 전체적인 project상태
}
