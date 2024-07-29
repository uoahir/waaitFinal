package com.waait.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseDto<T> {
	private int statusCode; // HTTP 상태코드
	private int code; // 성공시 1, 실패시 -1	
	private String message; // alert 창에 사용할 메시지
	private String resultCode; // 성공시 success 실패시 fail
	private T data; // 반환할 데이터
	
}
