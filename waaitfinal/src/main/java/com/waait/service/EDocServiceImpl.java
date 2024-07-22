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
			

			for(int i = 0; i < approval.length; i++) {
					
				Approval app = Approval.builder().appEmp(approval[i]).docId(appId).appOrder(i+1).build();
				System.out.println(app);
				edocDao.insertApproval(session, app);
			}	
			
			successCount++;
			// approval line 데이터가 생성됨. -> 결재라인에 결재자들이 순서대로 들어가있음
			// Document에 있는 현재결재자 컬럼값을 바로 업데이트 해줘야 함. 
			
			edocDao.updateFirstApprover(session, appId);
			successCount++;
			
		} catch(Exception e) {
			throw new RuntimeException("One of the tasks failed", e);
		}
		return successCount;
	}


//	승인대기문서 출력
	@Override
	public List<Document> awaitingApproval(Long empNo, Map<String, Integer> page) {
		return edocDao.awaitingApproval(session, empNo, page);  // empNo : 로그인된 아이디임 !!!! 
	}

	@Override
	public Document selectDocumentById(int docId) {
		// TODO Auto-generated method stub
		return edocDao.selectDocumentById(session, docId);
	}

	@Override
	public Document selectDocumentDetail(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return edocDao.selectDocumentDetail(session, param);
	}

	@Override
	public int updateFirstOpened(int docId) {
		// TODO Auto-generated method stub
		return edocDao.updateFirstOpened(session, docId);
	}

	@Override
	public List<Approval> selectApprovalByDocId(int docId) {
		// TODO Auto-generated method stub
		return edocDao.selectApprovalByDocId(session, docId);
	}

	@Override
	public Approval selectApprovalByDocIdAndEmpNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return edocDao.selectApprovalByDocIdAndEmpNo(session, param);
	}

	@Transactional
	@Override
	public int updateApproval(Map<String, Object> param) {
		int updateCount = 0;
		try {
			edocDao.updateAppStat(session, param);
			updateCount ++;
			edocDao.updateDocCurrentApprover(session, param);
			updateCount++;
			
		} catch(Exception e) {
			throw new RuntimeException("One of the task failed", e);
		}
		return updateCount;
	}

	@Transactional
	@Override
	public int updateFinalApproval(Map<String, Object> param) {
		int updateCount = 0;
		try {
			
			edocDao.updateAppStat(session, param);
			updateCount++;
			edocDao.updateDocStatToApproval(session, param);
			updateCount++;
			
		} catch(Exception e) {
			throw new RuntimeException("One of the task failed", e);
		}
		return 0;
	}
	
	
	
	
	
	
	


	
	
	
	
}
