package com.waait.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.service.ChattingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChattingController {

	private final ChattingService service;
	
	
	@GetMapping("/open.do")
	public String chatOpen() {
		System.out.println("채팅 오픈");
		
		return "chatting/chatopen";
	}
	
	
	
	//채팅방 유저리스트 페이지 
	@GetMapping("/userlist.do")
	public String chatUserlist(Model model) {
		//로그인된 사원 가져오기
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		System.out.println("채팅 유저리스트");
		System.out.println("controller-chatUserlist : "+loginEmployee);
		
		List<Employee> employees = service.selectEmployeelist();
		System.out.println("controller-chatUserlist : "+employees);
		
		model.addAttribute("employees",employees);
		
		return "chatting/chatuserlist";
	}
	
	
	//채팅방 채팅방목록 페이지
	@GetMapping("/roomlist.do")
	public String chatRoomlist() {
		System.out.println("채팅 채팅방목록");
		
		return "chatting/chatroomlist";
	}
	
	
	//채팅방 오픈채팅방목록 페이지
	@GetMapping("/openroomlist.do")
	public String chatOpenRoomlist() {
		System.out.println("채팅 오픈채팅방목록");
		
		return "chatting/chatopenroomlist";
	}
	
	
	//채팅방 채팅
	@GetMapping("/chatroomopen.do")	// /chatroomopen.do/{chatRoomNo}
	public String chatRoomOpen() {
		System.out.println("채팅방 열기");
		return "chatting/chatroom";
	}
	
	
}
