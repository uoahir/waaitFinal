package com.waait.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.EDocDao;
import com.waait.dto.Approval;
import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EDocServiceImpl implements EDocService {
	

	private final EDocDao edocDao;
	private final SqlSession session;
	
//	결재선 지정 로직
	@Override
	public List<Employee> employeeList() {
		// TODO Auto-generated method stub
		return edocDao.employeeList(session);
	}
	
	@Override
	public List<Department> deptList() {
		// TODO Auto-generated method stub
		return edocDao.deptList(session);
	}

//	내부보고서 insert 로직 ( 트랜잭셔널 ~ )
	@Transactional
	@Override
	public int insertBasicEdoc(Document document, int[] approval) {
		
		int successCount = 0;
		
		try {
			
			edocDao.insertDoc(session, document);
			successCount++;
			int result1=edocDao.insertEdocContent(session, document);
			successCount++;
		
			int appId = document.getDocId();
			
			if (result1>0) {
				for(int i = 0; i < approval.length; i++) {
					
					Approval app = Approval.builder().appEmp(approval[i]).docId(appId).appOrder(i+1).build();
					System.out.println(app);
					edocDao.insertApproval(session, app);
				}	
			}
				
			
		} catch(Exception e) {
			throw new RuntimeException("One of the tasks failed", e);
		}
		return successCount;
	}


//	승인대기문서 출력
	@Override
	public List<Document> awaitingApproval(Long empNo, Map<String, Integer> page) {
		return edocDao.awaitingApproval(session, empNo, page); 
	}


	
	
	
	
}
