package com.waait.mypage.model.dto;

import org.springframework.security.core.context.SecurityContextHolder;

public class Mypage {
	
	public void test() {
		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
