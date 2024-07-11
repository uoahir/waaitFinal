package com.waait.dto;

import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Schedule {

	private int scheNo;
	private int reserveNo;
	private int empNo;
	private int teamNo;
	private Time scheduleTime;
	private String startNo;
	private String endNo;
	private String scheduleTitle;
	private String scheduleContent;
	private String scheduleAllDay;
	private String scheColor;
	private String scheWriter;
	private String scheReWriter;
	private String scheType;
	private String schePrivate;
	
}
