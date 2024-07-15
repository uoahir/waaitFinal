package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

public interface EDocService {

//	결재선 추가 시 필요한 데이터
	List<Employee> employeeList();
	List<Department> deptList();
	
//	결재 로직
	int insertBasicEdoc(Document document, int[] approval); // 내부보고서(기본문서 작성)
	List<Document> awaitingApproval(Long empNo, Map<String,Integer> page);
	
	
	
}
