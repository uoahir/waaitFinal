package com.waait.dto;

import java.sql.Timestamp;

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
	
	private String empName; //사원이름 -> employee 테이블
	private String empEmail; //사원이메일 -> employee	
	private int mypageNo; //마이페이지 고유 번호 (필요한가?) 
	private long empNo; //사원번호 -> employee,vacation
	private int vacaNo; //휴가번호 -> vacation
	private int docId; //문서번호 -> vacation,document, off_form
	//private String docTitle; //문서제목 -> document
	private String vacaPermit; //승인상태 -> vacation
	private String vacaType; //연차구분(연차/반차/병가/공가/조퇴) -> vacation, off_form
	private String startDate; //연차시작일  -> off_form
	private String endDate; //연차종료일 -> off_form
	private int vacaLeft; //신청하고 남은 보유 연차 -> vacation
	private int basicAnnualLeave; //기본연차 -> employee	
	//근태관련
	private String workStart;
	private String workEnd; 
		
}

