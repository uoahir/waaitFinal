package com.waait.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.EDocDao;
import com.waait.dto.Department;
import com.waait.dto.Document;
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

	@Transactional
	@Override
	public int insertBasicEdoc(Document document) {
//		내부보고서 insert 로직 ( 트랜잭셔널 ~ )
		
		int successCount = 0;
		
		try {
			
			dao.insertDoc(session, document);
			successCount++;
			dao.insertEdocContent(session, document);
			successCount++;
			
		} catch(Exception e) {
			throw new RuntimeException("One of the tasks failed", e);
		}
		return successCount;
	}
	
}
