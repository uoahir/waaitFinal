package com.waait.dto;

import java.sql.Timestamp;
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
	private Timestamp appDate;
	private String reason;
	private Employee employee;
}
