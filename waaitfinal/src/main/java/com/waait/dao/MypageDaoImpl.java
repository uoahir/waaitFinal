package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Employee;
import com.waait.dto.Mypage;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MypageDaoImpl implements MypageDao {
	
	private SqlSession session;
	
//	@Override
//	public int updateEmpPwd(SqlSession session, Employee e) {
//		return session.insert("session.updateEmpPwd",e);
//	}
	@Override
	public List<Mypage> myInfoList(SqlSession session, long empNumber) {
		return session.selectList("mypage.myInfoList",empNumber);
	}

	
	
	
	

}
