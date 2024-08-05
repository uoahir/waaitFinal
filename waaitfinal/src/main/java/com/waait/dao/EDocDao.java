package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.AbstractDocument;
import com.waait.dto.Approval;
import com.waait.dto.AttatchFile;
import com.waait.dto.BasicDocument;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;
import com.waait.dto.TripDocument;

public interface EDocDao {
	
//	결재선 추가 시 필요한 데이터
	List<Employee> employeeList(SqlSession session);
	List<Department> deptList(SqlSession session);
	
//  공통 insert	
	int insertDoc(SqlSession session, AbstractDocument doc);
	
//	기본보고서 insert
	int insertEdocContent(SqlSession session, AbstractDocument doc);
	int insertApproval(SqlSession session, Approval approval);
	
//	휴가신청서 insert
	int insertOffContent(SqlSession session, AbstractDocument doc);
	int insertVacation(SqlSession session, Map<String, Object> param);
	int updateEmployeeRemainingLeave(SqlSession session, Map<String, Object> param);
	
//	결재라인, 최초 문서 상신 시 현재결재자 update
	int updateFirstApprover(SqlSession session, int docId);
	
//	승인대기문서 select
	List<AbstractDocument> awaitingApproval(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	진행중인문서 select
	List<AbstractDocument> inprogressDocument(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	승인완료된 내문서 select
	List<AbstractDocument> approvedDocument(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	임시저장 문서 select
	List<AbstractDocument> savedDocument(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	문서선택 ~ 
	AbstractDocument selectDocumentById(SqlSession session, int docId);
	
	int updateFirstOpened(SqlSession session, int docId);
	
	BasicDocument selectBasicDocument(SqlSession session, Map<String,Object> param);
	TripDocument selectTripDocument(SqlSession session, Map<String,Object> param);
	OffDocument selectOffDocument(SqlSession session, Map<String,Object> param);
	
	List<Approval> selectApprovalByDocId(SqlSession session, int docId);
	
	List<AbstractDocument> approvedAllDocument(SqlSession session, Map<String,Integer> page);
	
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
//	휴가신청서 
	int updateVacation(SqlSession session, Map<String, Object> param);
	
//	반려로직
	int updateAppStatToReject(SqlSession session, Map<String, Object> param);
	int updateDocStatToReject(SqlSession session, Map<String, Object> param);

//	휴가신청서 반려로직인 경우 잔여연차 되돌려주는 로직
	int returnEmployeeRemainingAnnualLeave(SqlSession session, Map<String, Object> param);
	
//	반려문서 뽑아오기
	List<AbstractDocument> rejectedDocument(SqlSession session, Long empNo, Map<String,Integer> page);
	
//	사원의 연차정보 뽑아오기
	List<OffDocument> getOffDocumentList(SqlSession session, Long empNo);
	
//	사원의 잔여연차 뽑아오기
	int getRemainingOff(SqlSession session, Long empNo);
	
//	작성자 정보 뽑아오기
	Employee getWriter(SqlSession session, Long empNo);
	
//	파일업로드로직
	int uploadFile(SqlSession session, Map<String,Object> param);
	
//	진행 중인 문서 개수 뽑아오기
	int inprogressCount(SqlSession session, Long empNo);
	
	int awaitingApprovalTotal(SqlSession session, Long empNo);
	
//	임시저장
	int updateDocStatToSave(SqlSession session,Long empNo);
	
//	회수
	int updateDocStatToReturn(SqlSession session,Map<String,Object> param);
	
	int saveDocumentCount(SqlSession session, Long empNo);
		
	int approvedCount(SqlSession session, Long empNo);
	
	int approvedAllCount(SqlSession session);
}