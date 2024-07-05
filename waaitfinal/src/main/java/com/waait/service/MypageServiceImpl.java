package com.waait.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MypageDao;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageServiceImpl implements MypageService {
	
	private final MypageDao dao;
	private final SqlSession session;
	@Override
	public int updateEmpPwd(Employee e) {
		return dao.updateEmpPwd(session,e);
	}

	

}
