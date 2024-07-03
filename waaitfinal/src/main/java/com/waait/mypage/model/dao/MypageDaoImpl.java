package com.waait.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.mypage.model.dto.Mypage;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MypageDaoImpl implements MypageDao {
	
	private SqlSession session;

	@Override
	public String selectByEmpNo(SqlSession session, String empNo) {
		return session.selectOne("mypage.selectByEmpNo",empNo);
	}

	@Override
	public int newEmpPwd(SqlSession sesion, Mypage m) {
		return session.insert("mypage.newPemPwd",m);
	}
	
	

}
