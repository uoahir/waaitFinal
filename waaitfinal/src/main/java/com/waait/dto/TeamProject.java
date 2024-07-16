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
	private String projectName; //
	private String projectSummary; //프로젝트 내용
	private Date projectStartDate;
	private Date projectEndDate;
	private List<String> functionBoxList;

}
