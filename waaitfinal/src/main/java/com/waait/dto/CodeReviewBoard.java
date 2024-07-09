package com.waait.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CodeReviewBoard {
	private Integer codeBoardNo;
	private String codeBoardTitle;
	private String developmentType;
	private String codeWrite;
	private String codeContent;
	private String codeReviewComment;
	private CodeReviewBoardFile codeFile;
	private String codeType;
	private Date writeDate;
	private Long empNo;
}


 	