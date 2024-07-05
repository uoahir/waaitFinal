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
public class CodeReviewBoardFile {
	
	private int codeReviewFileNo;
	private String originalFileName;
	private String renameFileName;
	private Date uploadDate;
	private int codeBoardNo;
}
