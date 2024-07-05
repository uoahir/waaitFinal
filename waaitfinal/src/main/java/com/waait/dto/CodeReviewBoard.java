package com.waait.dto;

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
	private CodeReviewBoardFile codeFile;
	private String codeType;
	private String writeDate;
	private Long employeeNo;
}




