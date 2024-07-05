package com.waait.dto;

import javax.validation.constraints.Pattern;

public class Mypage {
	
	private int mypageNo; //마이페이지 고유 번호
	private int empNo; // 사원 고유 번호
	@Pattern(regexp="(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,}"  //비밀번호 정규 표현식
			,message="비밀번호는 소문자,숫자,특수기호를 포함한 8글자 이상으로 작성하세요")
	private String empPw; // 사원 비밀번호
	private int vacationNo; // 휴가 고유번호
	private int workNo; // 근태현황 고유변호 
	
	//이렇게 하면 session에 저장된 사원 정보 가져올 수 있음 
//	request.getSession() 이렇게 했던거랑 같음
//	public void test() {
//		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	}

}
