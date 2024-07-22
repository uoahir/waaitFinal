package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MailReceiver {
	private int mailReceiverNo;
	private int mailNo;
	private String mailReceiverAddress;
	private String receiverReadStatus;
	private String receiverDeleteStatus;
}
