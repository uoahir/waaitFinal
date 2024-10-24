package com.waait.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CodeReviewBoardComment {
	private int codeReviewNo;
	private String codeReviewName;
	private String codeReviewContent;
	private Date codeReviewDate;
	private long empNo;
	private int codeBoardNo;
	
	
}
