package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Approval;
import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

public interface EDocDao {
	
//	결재선 추가 시 필요한 데이터
	List<Employee> employeeList(SqlSession session);
	List<Department> deptList(SqlSession session);
	
//  내부보고서 insert	
	int insertDoc(SqlSession session, Document doc);
	int insertEdocContent(SqlSession session, Document doc);
	int insertApproval(SqlSession session, Approval approval);
	
//	결재라인, 최초 문서 상신 시 현재결재자 update
	int updateFirstApprover(SqlSession session, int docId);
	
//	승인대기문서 select
	List<Document> awaitingApproval(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	문서선택 ~ 
	Document selectDocumentById(SqlSession session, int docId);
	
	int updateFirstOpened(SqlSession session, int docId);
	
	Document selectDocumentDetail(SqlSession session, Map<String,Object> param);
	
	List<Approval> selectApprovalByDocId(SqlSession session, int docId);
	
	Approval selectApprovalByDocIdAndEmpNo(SqlSession session, Map<String,Object> param);
	
//	승인버튼 클릭 시 ! 
//	approval(결재) 테이블에서 해당 결재자의 결재상태 승인으로 update !
	int updateAppStat(SqlSession session, Map<String,Object> param);
	
//	중간결재자인 경우
//	document(문서) 테이블에서 해당 결재의 현재결재자를 다음결재자로 update ! 
	int updateDocCurrentApprover(SqlSession session, Map<String,Object> param);

//	최종결재자인 경우
//	document(문서) 테이블에서 해당 문서의 status를 검토중 -> 승인으로 update ! 
	int updateDocStatToApproval(SqlSession session, Map<String,Object> param);
}