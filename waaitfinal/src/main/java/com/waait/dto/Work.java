package com.waait.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Work {
	private int workNo;
	private Long empNo;
	private Date workDate;
	private Timestamp workStart;
	private Timestamp workEnd;
	private String workStatus;
}
