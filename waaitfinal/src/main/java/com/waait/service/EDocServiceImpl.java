package com.waait.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.EDocDao;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EDocServiceImpl implements EDocService {

	private final EDocDao dao;
	private final SqlSession session;
	
	@Override
	public List<Employee> employeeList() {
		// TODO Auto-generated method stub
		return dao.employeeList(session);
	}

}
