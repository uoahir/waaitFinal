package com.waait.dto;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import lombok.Data;

@Data
// 추상클래스는 인스턴스화 불가능 ( 객체바로 생성할 수 없음 ) -> 따라서 Builder 어노테이션 사용 불가
public abstract class AbstractDocument implements DocumentInter {
	private int docId;
	private int rnum;
	private int docWriter;
	private Employee employee;
	// employee 
	private String docType;
	private Type type;
	private int approver;
	private String docTitle;
	private Date docDate;
	private String docStat;
	private String docOpen;
	private String docLife;
	private int isFirstOpened;
	private List<Approval> approvals = new ArrayList<>();
	// list는 작성자 기준으로 결재자 확인용
	private Approval approvalOne; 
	// approval 객체는 결재자 기준 화면출력용
	private List<AttatchFile> attachFiles = new ArrayList<>();
	private String oriFilename;
	private String renamedFilename;
	private String docNumber; // 최종 승인 시 문서번호
	private int[] empNo;
	
	
	public String getDocNumber() {
		return docNumber;
	}
	public void setDocNumber(String docNumber) {
		this.docNumber = docNumber;
	}
	public int getDocId() {
		return docId;
	}
	public void setDocId(int docId) {
		this.docId = docId;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getDocWriter() {
		return docWriter;
	}
	public void setDocWriter(int docWriter) {
		this.docWriter = docWriter;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public int getApprover() {
		return approver;
	}
	public void setApprover(int approver) {
		this.approver = approver;
	}
	public String getDocTitle() {
		return docTitle;
	}
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	public Date getDocDate() {
		return docDate;
	}
	public void setDocDate(Date docDate) {
		this.docDate = docDate;
	}
	public String getDocStat() {
		return docStat;
	}
	public void setDocStat(String docStat) {
		this.docStat = docStat;
	}
	public String getDocOpen() {
		return docOpen;
	}
	public void setDocOpen(String docOpen) {
		this.docOpen = docOpen;
	}
	public String getDocLife() {
		return docLife;
	}
	public void setDocLife(String docLife) {
		this.docLife = docLife;
	}
	public int getIsFirstOpened() {
		return isFirstOpened;
	}
	public void setIsFirstOpened(int isFirstOpened) {
		this.isFirstOpened = isFirstOpened;
	}
	public List<Approval> getApprovals() {
		return approvals;
	}
	public void setApprovals(List<Approval> approvals) {
		this.approvals = approvals;
	}
	public Approval getApprovalOne() {
		return approvalOne;
	}
	public void setApprovalOne(Approval approvalOne) {
		this.approvalOne = approvalOne;
	}
	public String getOriFilename() {
		return oriFilename;
	}
	public void setOriFilename(String oriFilename) {
		this.oriFilename = oriFilename;
	}
	public String getRenamedFilename() {
		return renamedFilename;
	}
	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}
	
	// 해쉬코드, 이퀄즈, 투스트링 오버라이드!
	@Override
	public int hashCode() {
		return Objects.hash(approvalOne, approvals, approver, docDate, docId, docLife, docNumber, docOpen, docStat,
				docTitle, docType, docWriter, employee, isFirstOpened, oriFilename, renamedFilename, rnum, type);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AbstractDocument other = (AbstractDocument) obj;
		return Objects.equals(approvalOne, other.approvalOne) && Objects.equals(approvals, other.approvals)
				&& approver == other.approver && Objects.equals(docDate, other.docDate) && docId == other.docId
				&& Objects.equals(docLife, other.docLife) && Objects.equals(docNumber, other.docNumber)
				&& Objects.equals(docOpen, other.docOpen) && Objects.equals(docStat, other.docStat)
				&& Objects.equals(docTitle, other.docTitle) && Objects.equals(docType, other.docType)
				&& Objects.equals(docWriter, other.docWriter) && Objects.equals(employee, other.employee)
				&& isFirstOpened == other.isFirstOpened && Objects.equals(oriFilename, other.oriFilename)
				&& Objects.equals(renamedFilename, other.renamedFilename) && rnum == other.rnum
				&& Objects.equals(type, other.type);
	}
	@Override
	public String toString() {
		return "AbstractDocument [docId=" + docId + ", rnum=" + rnum + ", docWriter=" + docWriter + ", employee="
				+ employee + ", docType=" + docType + ", type=" + type + ", approver=" + approver + ", docTitle="
				+ docTitle + ", docDate=" + docDate + ", docStat=" + docStat + ", docOpen=" + docOpen + ", docLife="
				+ docLife + ", isFirstOpened=" + isFirstOpened + ", approvals=" + approvals + ", approvalOne="
				+ approvalOne + ", oriFilename=" + oriFilename + ", renamedFilename=" + renamedFilename + ", docNumber="
				+ docNumber + "]";
	}

	
	
	
	
}
