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
	
//	승인대기문서 select
	List<Document> awaitingApproval(SqlSession session, Long empNo, Map<String,Integer> page);
	
	
}