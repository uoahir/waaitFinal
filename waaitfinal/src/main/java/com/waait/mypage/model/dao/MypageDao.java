package com.waait.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.waait.mypage.model.dto.Mypage;

public interface MypageDao {
	
	//원래 비밀번호 가져오기 -> select 
	String selectEmpPwd(SqlSession session ,String empPwd);
	//새로운 비밀번호 db에 저장하기 -> insert
	int newEmpPwd(SqlSession sesion ,Mypage m);
	
}
