package com.waait.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.ChattingDao;
import com.waait.dto.CodeReviewBoard;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChattingServiceImpl implements ChattingService {

	private final SqlSession session;
	private final ChattingDao dao;
	
	
	@Override
	public List<Employee> selectEmployeelist() {
		List<Employee> employees = dao.selectEmployeelist(session);
		return employees;
	}
	
	
	
	
}
