package com.waait.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Document {
	private int docId;
	private String docWriter;
	private String docType;
	private Type type;
	private String docContent;
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
	private String oriFilename;
	private String renamedFilename;
	// before after ? ? 
	// insert 를 2번  ? ? ? 
	// collection
	// association
}
