package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TodayWork {
	private Long empNo; //번호
	private String workLate; //지각
	private String workFastEnd; // 조퇴
	private String workAbsent; // 결근
	private String workOver; //초과근무여부
	private String workOff; //연차여부
}
