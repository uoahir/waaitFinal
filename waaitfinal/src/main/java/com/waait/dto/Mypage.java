package com.waait.dto;

import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Mypage {
	
	private String empName;
	private int mypageNo; //마이페이지 고유 번호
	private long empNo; // 사원 고유 번호
	private String empPw; // 사원 비밀번호
	private int vacationNo; // 휴가 고유번호
	private int workNo; // 근태현황 고유변호 
	
}

