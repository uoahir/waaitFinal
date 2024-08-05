package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.AbstractDocument;
import com.waait.dto.Approval;
import com.waait.dto.AttatchFile;
import com.waait.dto.BasicDocument;
import com.waait.dto.Department;
import com.waait.dto.Document;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;
import com.waait.dto.TripDocument;

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
	public int insertDoc(SqlSession session, AbstractDocument doc) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertBasicEdoc",doc);
	}

//	기본보고서 내용 insert
	@Override
	public int insertEdocContent(SqlSession session, AbstractDocument doc) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertBasicContent", doc);
	}

//	공통 결재라인 insert
	@Override
	public int insertApproval(SqlSession session, Approval approval) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertApproval", approval);
	}

	
//	승인대기문서 select
	@Override
	public List<AbstractDocument> awaitingApproval(SqlSession session, Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		
		RowBounds rb = new RowBounds((page.get("cPage")-1)*page.get("numPerpage"), page.get("numPerpage"));
		return session.selectList("edoc.awaitingApproval", empNo, rb); // empNo : 로그인된 ID
	}
	
//	승인대기문서 중 클릭한 문서 select 로직 (상세문서)
	@Override
	public BasicDocument selectBasicDocument(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.selectBasicDocument", param);
	}

	@Override
	public TripDocument selectTripDocument(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.selectTripDocument", param);
	}

	@Override
	public OffDocument selectOffDocument(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.selectOffDocument", param);
	}
	
//	insert시 첫번째 결재자를 document 테이블의 현재결재자로 update	
	@Override
	public int updateFirstApprover(SqlSession session, int docId) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateFirstApprover", docId);
	}

	@Override
	public AbstractDocument selectDocumentById(SqlSession session, int docId) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.selectDocumentById",docId);
	}

	@Override
	public int updateFirstOpened(SqlSession session, int docId) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateFirstOpened", docId);
	}

	@Override
	public List<Approval> selectApprovalByDocId(SqlSession session, int docId) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.selectApprovalByDocId", docId);
	}

	@Override
	public Approval selectApprovalByDocIdAndEmpNo(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.selectApprovalByDocIdAndEmpNo", param);
	}

	@Override
	public int updateAppStat(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateAppStat", param);
	}

	@Override
	public int updateDocCurrentApprover(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateDocCurrentApprover", param);
	}

	@Override
	public int updateDocStatToApproval(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateDocStatToApproval", param);
	}

	@Override
	public List<AbstractDocument> inprogressDocument(SqlSession session, Long empNo, Map<String, Integer> page) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((page.get("cPage")-1)*page.get("numPerpage"), page.get("numPerpage"));
		return session.selectList("edoc.inprogressDocument",empNo,rb);
	}

	@Override
	public List<AbstractDocument> approvedDocument(SqlSession session, Long empNo, Map<String, Integer> page) {
		RowBounds rb = new RowBounds((page.get("cPage")-1)*page.get("numPerpage"), page.get("numPerpage"));
		return session.selectList("edoc.approvedDocument",empNo,rb);
	}

	@Override
	public int insertOffContent(SqlSession session, AbstractDocument doc) {
		// TODO Auto-generated method stub
		OffDocument odoc = (OffDocument) doc;
		return session.insert("edoc.insertOffContent", odoc);
	}

	@Override
	public int insertVacation(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("edoc.insertVacation", param);
	}

	@Override
	public int updateVacation(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateVacation", param);
	}

//	휴가신청서 상신 시, employee 의 remainingLeave를 변경 
	@Override
	public int updateEmployeeRemainingLeave(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateEmployeeRemainingLeave", param);
	}

//	사원의 연차정보 뽑아오기
	@Override
	public List<OffDocument> getOffDocumentList(SqlSession session, Long empNo) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.getOffDocumentList", empNo);
	}

	@Override
	public int getRemainingOff(SqlSession session, Long empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.getRemainingOff", empNo);
	}

//	작성자정보뽑아오기
	@Override
	public Employee getWriter(SqlSession session, Long empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.getWriter", empNo);
	}

	@Override
	public int uploadFile(SqlSession session, Map<String,Object> param) {
		// TODO Auto-generated method stub
		return session.insert("edoc.uploadFile", param);
	}

	@Override
	public int updateAppStatToReject(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateAppStatToReject", param);
	}

	@Override
	public int updateDocStatToReject(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.updateDocStatToReject",param);
	}

	@Override
	public int returnEmployeeRemainingAnnualLeave(SqlSession session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("edoc.returnEmployeeRemainingAnnualLeave", param);
	}

	@Override
	public List<AbstractDocument> rejectedDocument(SqlSession session, Long empNo, Map<String, Integer> page) {
		RowBounds rb = new RowBounds((page.get("cPage")-1)*page.get("numPerpage"), page.get("numPerpage"));
		return session.selectList("edoc.rejectedDocument", empNo , rb);
	}

	@Override
	public int inprogressCount(SqlSession session, Long empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("edoc.inprogressCount", empNo);
	}	
	
	
	
	
	
	
}
