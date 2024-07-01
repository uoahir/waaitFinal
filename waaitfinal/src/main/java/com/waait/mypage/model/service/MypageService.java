package com.waait.mypage.model.service;

import com.waait.mypage.model.dto.Mypage;

public interface MypageService {
	
	//원래 비밀번호 가져오기 -> select 
	String selectEmpPwd(String empPwd);
	//새로운 비밀번호 db에 저장하기 -> insert
	int newEmpPwd(Mypage m);

}
