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
	private int currentApprover;
	private String docTitle;
	private Date docDate;
	private String docStatus;
	private String docOpen;
	private String docLife;
	private List<Approval> approvals = new ArrayList<>();
	private String oriFilename;
	private String renamedFilename;
	// before after ? ? 
	// insert 를 2번  ? ? ? 
	// collection
	// association
}
