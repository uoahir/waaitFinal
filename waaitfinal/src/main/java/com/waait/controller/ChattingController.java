package com.waait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String chatUserlist() {
		System.out.println("채팅 유저리스트");
		
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
	
	
}
