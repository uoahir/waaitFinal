package com.waait.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.dto.Mypage;
import com.waait.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mypage")
@Slf4j
@RequiredArgsConstructor
@Controller
public class MypageController {
	
	private final MypageService service;
	
	// 마이페이지 데모창으로 보냄
	@GetMapping("/mypagemain")
	public String mypageMain(Mypage empNo,Model model) {
		
		Mypage mypage=new Mypage();
		Employee employee=getLoginEmpInfo();
		long empNumber=employee.getEmpNo();
//		Schedule empno=empNumber
		
		List<Mypage> total=service.myInfoList(empNumber);
		System.out.println(total);
		mypage.setEmpNo(empNumber);
		
		model.addAttribute("total", total);
		total.forEach(e->{
			System.out.println(e);
		});			
		return "mypage/mypageindex";
	}
	
	//사용자 로그인 시큐리티로 데이터 가져오기
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	// 마이페이지 인덱스 구현창으로 보냄
//	@GetMapping("/mypagemain")
//	public String mypageIndex(Mypage empNo,Model model) {
//		
//		Mypage mypage=new Mypage();
//		Employee employee=getLoginEmpInfo();
//		long empNumber=employee.getEmpNo();
//		
//		List<Mypage> total=service.myInfoList(empNumber);
//		System.out.println(total);
//		mypage.setEmpNo(empNumber);
//		
//		model.addAttribute("total", total);
//		total.forEach(e->{
//			System.out.println(e);
//		});			
//		return "mypage/mypageindex";
//	}
	
	
	

}
