package com.waait.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.service.ChattingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChattingController {

	private final ChattingService service;
	
	
	@GetMapping("/open.do")
	public String chatOpen(
			Model model,
			@RequestParam (value = "chatRoomNo", defaultValue = "0")int chatRoomNo
			) {
		System.out.println("채팅 오픈");
		//로그인된 사원 가져오기
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		System.out.println("controller-chatUserlist login회원 : "+loginEmployee);
		
		List<Employee> employees = service.selectEmployeelist();
		System.out.println("controller-chatUserlist : "+employees);
		model.addAttribute("employees",employees);
		
		if(chatRoomNo != 0) {
			model.addAttribute("chatRoomNo",chatRoomNo);			
		}
		
		return "chatting/chatopen";
	}
	
	
	
	//채팅방 채팅
	@GetMapping("/chatroomopen.do")
	public String chatRoomOpen(
			Model model,
			@RequestParam int chatroomNo,
			@RequestParam int loginEmpNo
			) {
		Map<String, Integer> param = Map.of(
			"chatroomNo", chatroomNo,
			"loginEmpNo", loginEmpNo
		);
		System.out.println("컨트롤러 - chatRoomOpen - 채팅방 번호 : "+param.get("chatroomNo"));
		System.out.println("컨트롤러 - chatRoomOpen - 로그인된 사원 번호 : "+param.get("loginEmpNo"));
		
		ChatRoom chatName = service.selectChatRoomName(param);
		List<ChatHistory> chatHistorys = service.selectChatRoomHistory(param);
		
		System.out.println("컨트롤러 - chatRoomOpen - chatName : "+chatName);
		System.out.println("컨트롤러 - chatRoomOpen - chatHistory : "+chatHistorys);
		
		model.addAttribute("chatName",chatName);
		model.addAttribute("chatHistorys",chatHistorys);
		
		return "chatting/chatroom";
	}
	
	
	//채팅방추가 일반채팅
	@GetMapping("/chatinvitation.do")
	public String chatinvitationOpen(Model model) {
		System.out.println("컨트롤러 - chatinvitationOpen - 일반채팅");
		
		List<Employee> employees = service.selectEmployeelist();
		System.out.println("컨트롤러 - chatinvitationOpen - 일반채팅 - employees : "+employees);
		model.addAttribute("employees",employees);
		
		return "chatting/chatinvitation";
	}
	

	//insert하면서 방을 생성하고 새창열기로 만든 채팅방? 열고
	@PostMapping("/insertchatroom.do")
	public String insertChatRoom (
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "chatRoomName", defaultValue = "") String chatRoomName ,
			@RequestParam("chatemps") List<Long> chatEmpNo
			) {
		System.out.println("insertChatRoom 채팅방생성 메소드");
		
		System.out.println("chatRoomName : "+chatRoomName);
		System.out.println("chatEmpNo : "+chatEmpNo);
		
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		Long loginEmpNo = null;
		String chatRoomType = "C1";	//방 타입 1개인 2그룹 3오픈
		System.out.println("1");
		Map<String , Object> chatRoomParam = new HashMap<>();
		
		if(chatEmpNo.size()>1) {
			chatRoomType = "C2";
		}
		System.out.println("2");
		if(!chatRoomType.equals("C1")) {
			loginEmpNo = loginEmployee.getEmpNo();	
		}
		System.out.println("3");
		chatRoomParam.put("chatRoomType", chatRoomType);	//방 타입
		chatRoomParam.put("loginEmpNo", loginEmpNo);	//로그인된 사원번호 (개설자)
		chatRoomParam.put("chatRoomName", chatRoomName);	//채팅방 이름
		System.out.println("4");
		int result = service.insertChatRoom(chatRoomParam);
		System.out.println("5");
		
		
		System.out.println("insertChatRoom : "+result);
		
//		Map<String, Object> chatJoinParam = new HashMap<>();
		System.out.println("chatEmpNo : "+chatEmpNo);
		chatEmpNo.add(loginEmployee.getEmpNo());
//		chatJoinParam.put("채팅방번호", chatJoinParam); //service에서 시퀀스번호 가져와 저장하기?
//		chatJoinParam.put("chatEmpNo", chatEmpNo);
		
//		System.out.println("컨트롤러 chatJoinParam : "+chatJoinParam);
		
		//result2에 방번호가 담겨져있음
		int chatRoomNo = service.insertChatJoin(chatEmpNo);
		
		System.out.println("컨트롤러 insertChatJoin : "+chatRoomNo);
		
		redirectAttributes.addAttribute("chatRoomNo",chatRoomNo);
		
		return "redirect:/chat/open.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//채팅방 유저리스트 페이지 
	/*
	 * @GetMapping("/userlist.do") public String chatUserlist(Model model) { //로그인된
	 * 사원 가져오기 Employee loginEmployee =
	 * (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal
	 * (); System.out.println("채팅 유저리스트");
	 * System.out.println("controller-chatUserlist login : "+loginEmployee);
	 * 
	 * List<Employee> employees = service.selectEmployeelist();
	 * System.out.println("controller-chatUserlist : "+employees);
	 * 
	 * model.addAttribute("employees",employees);
	 * 
	 * return "chatting/chatuserlist"; }
	 */
	
	
	//채팅방 채팅방목록 페이지
//	@GetMapping("/roomlist.do")
//	public String chatRoomlist() {
//		System.out.println("채팅 채팅방목록");
//		
//		 
//		
//		return "chatting/chatroomlist";
//	}
//	
//	
//	//채팅방 오픈채팅방목록 페이지
//	@GetMapping("/openroomlist.do")
//	public String chatOpenRoomlist() {
//		System.out.println("채팅 오픈채팅방목록");
//		
//		return "chatting/chatopenroomlist";
//	}
//	
//	
	
	
}
