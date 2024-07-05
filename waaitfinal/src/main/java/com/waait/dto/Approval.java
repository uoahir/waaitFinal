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
public class Approval {
	private int appId;
	private int docId;
	private int appEmp;
	private int appOrder;
	private String appStat;
	private Date appDate;
	private String reason;
}
