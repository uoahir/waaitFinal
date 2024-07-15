package com.waait.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RecentSearch {
	private int recentSearchNo;
	private long empNo;
	private String searchType;
	private String searchValue;
	private Date searchDate;
}
