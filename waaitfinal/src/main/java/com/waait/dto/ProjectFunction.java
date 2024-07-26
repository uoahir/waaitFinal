package com.waait.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProjectFunction {
	private int functionNo;
	private Date functionStartDate;
	private Date functionEndDate;
	private int projectNo; //프로젝트 번호
	private String functionName;
	private String functionStatus;
}
