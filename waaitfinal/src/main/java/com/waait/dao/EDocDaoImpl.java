package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Approval;
import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;

@Repository
public class EDocDaoImpl implements EDocDao {

//	결재라인 출력 시 필요한 데이터
	@Override
	public List<Employee> employeeList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.employeelist");
	}
	
	@Override
	public List<Department> deptList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.deptlist");
	}
	
//	내부보고서 insert 결재로직
	@Override
	public int insertDoc(SqlSession session, Document doc) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertBasicEdoc",doc);
	}


	@Override
	public int insertEdocContent(SqlSession session, Document doc) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertBasicContent", doc);
	}


	@Override
	public int insertApproval(SqlSession session, Approval approval) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertApproval", approval);
	}

	
//	승인대기문서 select 결재로직
	@Override
	public List<Document> awaitingApproval(SqlSession session, Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		
		RowBounds rb = new RowBounds((page.get("cPage")-1)*page.get("numPerpage"), page.get("numPerpage"));
		return session.selectList("edoc.awaitingApproval", empNo, rb);
	}	
	
	
	
	
}
