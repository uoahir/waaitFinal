package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.AbstractDocument;
import com.waait.dto.Approval;
import com.waait.dto.AttatchFile;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;

public interface EDocService {

//	결재선 추가 시 필요한 데이터
	List<Employee> employeeList();
	List<Department> deptList();
	
//	결재 로직
	int insertBasicEdoc(AbstractDocument document, int[] approval, Map<String, Object> param, List<AttatchFile> files); // 내부보고서(기본문서 작성)
	int insertOffEdoc(AbstractDocument document, int[] approval, Map<String, Object> param, List<AttatchFile> files); // 휴가신청서(기본문서 작성)
	List<AbstractDocument> awaitingApproval(Long empNo, Map<String,Integer> page); // 승인대기문서 출력(결재자)
	List<AbstractDocument> inprogressDocument(Long empNo, Map<String,Integer> page); // 진행중인문서 출력(상신자)
	List<AbstractDocument> approvedDocument(Long empNo, Map<String,Integer> page); // 승인완료된 문서 출력(내가올린문서 중 승인완료된 건 !)
	AbstractDocument selectDocumentById(int docId); // 문서 조회 
	AbstractDocument selectDocumentDetail(Map<String, Object> param); // 결재자가 해당 문서 클릭 시 실행되는 로직 ~ ! ~ ! 
	// update 는 언제해죠야하지 ?
	int updateFirstOpened(int docId); // 결재자들 중 최초 결재자가 문서를 처음으로 열었을 때, 문서 상태를 상신 -> 검토 중 // 결재 상태를 승인전 -> 검토중 으로 update
	
//	반려로직
	int rejectDocument(Map<String,Object> param);
	
//	반려문서 뽑기
	List<AbstractDocument> rejectedDocument(Long empNo, Map<String,Integer> page);
	
//	해당문서 결재라인 가져오기
	List<Approval> selectApprovalByDocId(int docId);
	
//	문서아이디, 로그인한 아이디로 approval 정보 가져오기 ! 
	Approval selectApprovalByDocIdAndEmpNo(Map<String, Object> param);
	
//	기본문서 : 중간 결재자 - 승인버튼 클릭 시 approval table appStat update ~ ! document table approver update ~ !
	int updateApproval(Map<String,Object> param);
	
//	기본문서 : 최종 결재자 - 승인버튼 클릭 시 approval table appStat update ~ ! document table docStat update ~ ! 
	int updateFinalApproval(Map<String,Object> param);

//	사원의 연차정보 가져오기
	List<OffDocument> getOffDocumentList(Long empNo);
	
//	해당사원의 보유연차(잔여연차) 가져오기
	int getRemainingOff(Long empNo);
	
//	작성자 정보 뽑아오기
	Employee getWriter(Long empNo);
	
//	진행중인 문서 개수 뽑아오기 ! ! !
	int inprogressCount(Long empNo);
	
}
