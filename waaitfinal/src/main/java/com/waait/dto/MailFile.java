package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MailFile {
	private int mailFileNo;
	private int mailNo;
	private String mailOriginalFileName;
	private String mailRenamedFileName;
	private long mailFileSize;
}
