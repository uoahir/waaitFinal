package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyMailBoxDetail {
	private int myMailBoxDetailNo;
	private int mailNo;
	private int myMailBoxNo;
}
