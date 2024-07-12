package com.waait.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Mail {
	private int mailNo;
	private int employeeNo;
	private String senderMailAddress;
	private String senderName;
	private String mailTitle;
	private String mailContent;
	private String mailStatus;
	private String mailWriteDate;
	private String mailReadStatus;
	private Date receiverReadDate;
	private List<MailReceiver> receivers;
	private List<MailFile> files;
}
