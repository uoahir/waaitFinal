package com.waait.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private long empNo;
	private String deptCode;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime scheTime;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime scheEnd;	
	private String scheTitle;
	private String scheContent;
	private String scheAllDay;
	private String scheColor;
	private String scheWriter;
	private String scheReWriter;
	private String scheType;
	private String schePrivate;
	
}
