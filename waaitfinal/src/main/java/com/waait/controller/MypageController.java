package com.waait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mypage")
@Slf4j
@RequiredArgsConstructor
@Controller
public class MypageController {
	
	@GetMapping("/mypagemain")
	public String mypageMain() {
		
		return "mypage/mypagemain";
	}
	
	
	
	

}
