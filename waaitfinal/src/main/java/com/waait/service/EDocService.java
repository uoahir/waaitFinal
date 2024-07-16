package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Approval;
import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

public interface EDocService {

//	결재선 추가 시 필요한 데이터
	List<Employee> employeeList();
	List<Department> deptList();
	
//	결재 로직
	int insertBasicEdoc(Document document, int[] approval); // 내부보고서(기본문서 작성)
	List<Document> awaitingApproval(Long empNo, Map<String,Integer> page); // 승인대기문서 출력(결재자)
	Document selectDocumentById(int docId); // 문서 조회 
	Document selectDocumentDetail(Map<String, Object> param); // 결재자가 해당 문서 클릭 시 실행되는 로직 ~ ! ~ ! 
	// update 는 언제해죠야하지 ?
	int updateFirstOpened(int docId); // 결재자들 중 최초 결재자가 문서를 처음으로 열었을 때, 문서 상태를 상신 -> 검토 중으로 update
	
//	해당문서 결재라인 가져오기
	List<Approval> selectApprovalByDocId(int docId);
//	내가 올린 문서는 어떻게 확인 ? 
	
	
	
}
