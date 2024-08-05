package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.EDocDao;
import com.waait.dto.AbstractDocument;
import com.waait.dto.Approval;
import com.waait.dto.AttatchFile;
import com.waait.dto.BasicDocument;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;

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

//	휴가신청서 insert 로직 (트랜잭셔널 ~ )
	@Transactional
	@Override
	public int insertOffEdoc(AbstractDocument document, int[] approval, Map<String,Object> param, List<AttatchFile> files) {
		
		int successCount = 0;
		
		try {
			edocDao.insertDoc(session, (OffDocument)document);
			successCount ++;
			edocDao.insertOffContent(session, (OffDocument)document);
			successCount ++;
			
			int appId = document.getDocId();
			param.put("docId", appId);
			
			edocDao.insertVacation(session, param);
			successCount ++;
			
			edocDao.updateEmployeeRemainingLeave(session, param);
			successCount ++;
			//순서가 부모저장 된다음 파일 저장되면,파일 이있고,  0
			
			
			for(AttatchFile att : files) {
				param.put("originalFilename", att.getOriginalFilename());
				param.put("renamedFilename", att.getRenamedFilename());
				edocDao.uploadFile(session, param);
			}
			
			
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
//	기본보고서 insert 로직 (트랜잭셔널 ~ )
	@Transactional
	@Override
	public int insertBasicEdoc(AbstractDocument document, int[] approval, Map<String,Object> param, List<AttatchFile> files) {
		
		int successCount = 0;
		
		try {
			edocDao.insertDoc(session, (BasicDocument)document);
			successCount ++;
			edocDao.insertEdocContent(session, (BasicDocument)document);
			successCount ++;
			
			int appId = document.getDocId();
			param.put("docId", appId);
			
			for(AttatchFile att : files) {
				param.put("originalFilename", att.getOriginalFilename());
				param.put("renamedFilename", att.getRenamedFilename());
				edocDao.uploadFile(session, param);
			}
			
			
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
	
//	
////	내부보고서 insert 로직 ( 트랜잭셔널 ~ )
//	@Transactional
//	@Override
//	public int insertBasicEdoc(AbstractDocument document, int[] approval) {
//		
//		int successCount = 0;
//		
//		try {
//			
//			edocDao.insertDoc(session, (BasicDocument) document);
//			successCount++;
//			int result1=edocDao.insertEdocContent(session, (BasicDocument)document);
//			successCount++;
//		
//			int appId = document.getDocId();
//			
//
//			for(int i = 0; i < approval.length; i++) {
//					
//				Approval app = Approval.builder().appEmp(approval[i]).docId(appId).appOrder(i+1).build();
//				System.out.println(app);
//				edocDao.insertApproval(session, app);
//			}	
//			
//			successCount++;
//			// approval line 데이터가 생성됨. -> 결재라인에 결재자들이 순서대로 들어가있음
//			// Document에 있는 현재결재자 컬럼값을 바로 업데이트 해줘야 함. 
//			
//			edocDao.updateFirstApprover(session, appId);
//			successCount++;
//			
//		} catch(Exception e) {
//			throw new RuntimeException("One of the tasks failed", e);
//		}
//		return successCount;
//	}


//	승인대기문서 출력
	@Override
	public List<AbstractDocument> awaitingApproval(Long empNo, Map<String, Integer> page) {
		return edocDao.awaitingApproval(session, empNo, page);  // empNo : 로그인된 아이디임 !!!! 
	}

	@Override
	public AbstractDocument selectDocumentById(int docId) {
		// TODO Auto-generated method stub
		return edocDao.selectDocumentById(session, docId);
	}

	@Override
	public AbstractDocument selectDocumentDetail(Map<String,Object> param) {
		
		String docType = (String)param.get("docType");
		AbstractDocument doc = null;
		
		switch(docType) {
			case "T01": doc =  edocDao.selectBasicDocument(session, param); 
			case "T02": break;
			case "T03": doc = edocDao.selectTripDocument(session, param); 
			case "T04": doc = edocDao.selectOffDocument(session, param); 
		}
		
		return doc;
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
		System.out.println("service" + param);
		
		String docType = (String)param.get("docType");
		System.out.println(docType);
		try {
			
			edocDao.updateAppStat(session, param);
			updateCount++;
			edocDao.updateDocStatToApproval(session, param);
			updateCount++;
			if(docType.equals("T04")) {
				edocDao.updateVacation(session, param);
			}
			
		} catch(Exception e) {
			throw new RuntimeException("One of the task failed", e);
		}
		return updateCount;
	}

	@Override
	public List<AbstractDocument> inprogressDocument(Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return edocDao.inprogressDocument(session, empNo, page);
	}

	@Override
	public List<AbstractDocument> approvedDocument(Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return edocDao.approvedDocument(session, empNo, page);
	}

	@Override
	public List<OffDocument> getOffDocumentList(Long empNo) {
		// TODO Auto-generated method stub
		return edocDao.getOffDocumentList(session, empNo);
	}

	@Override
	public int getRemainingOff(Long empNo) {
		// TODO Auto-generated method stub
		return edocDao.getRemainingOff(session, empNo);
	}

	@Override
	public Employee getWriter(Long empNo) {
		// TODO Auto-generated method stub
		return edocDao.getWriter(session, empNo);
	}

//	반려로직
	@Transactional
	@Override
	public int rejectDocument(Map<String, Object> param) {
		int result=0;
		String docType = (String)param.get("docType");
		if(docType.equals("T04")) {
			edocDao.updateAppStatToReject(session, param);
			result++;
			edocDao.updateDocStatToReject(session, param);
			result++;
			edocDao.returnEmployeeRemainingAnnualLeave(session, param);
			result++;
		} else {
			edocDao.updateAppStatToReject(session, param);
			result++;
			edocDao.updateDocStatToReject(session, param);
			result++;
		}
		System.out.println("여기에서 휴가신청이면 3, 걍 기본이면 2" + result);
		
		return result;
	}

	@Override
	public List<AbstractDocument> rejectedDocument(Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return edocDao.rejectedDocument(session, empNo, page);
	}

	@Override
	public int inprogressCount(Long empNo) {
		// TODO Auto-generated method stub
		return edocDao.inprogressCount(session, empNo);
	}

	
	

	
	
	
	
	
	
}
