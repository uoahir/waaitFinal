package com.waait.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waait.dto.ChatHistory;
import com.waait.dto.ChatRoom;
import com.waait.dto.Employee;
import com.waait.service.ChattingService;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;


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
			@RequestParam int chatroomNo,
			Model model
			) {
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long loginEmpNo = loginEmployee.getEmpNo();
		
		Map<String, Number> param = Map.of(
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
		
		System.out.println("컨트롤러 - chatRoomOpen - chatroomNo : "+chatroomNo);
		
		Map<String, Object> chatEmployees = service.selectChatEmployeelist(chatroomNo);
		//Employee해서 사원목록 출력하고 초대 만들기 // 방번호로 chatjoin테이블가서 해당하는 사원만 가져옴
		model.addAttribute("employees",chatEmployees.get("employees"));
		//Employee chatroomno를 이용해서 해당 방에 없는 사원만 가져옴
		model.addAttribute("employeesnot",chatEmployees.get("employeesnot"));
		
		System.out.println("컨트롤러 - chatRoomOpen - chatEmployees : "+chatEmployees.get("employees"));
		System.out.println("컨트롤러 - chatRoomOpen - chatEmployeesnot : "+chatEmployees.get("employeesnot"));
		
		//chatHistoryCount 테이블 row삭제하기
		// 채팅방 들어갈때 해당 채팅방번호 + 사원번호 이용해서 count 지우기
		System.out.println("컨트롤러 - chatRoomOpen - param : "+param);
		service.deleteChatHistoryCount(param);
		
		
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

		Map<String , Object> chatRoomParam = new HashMap<>();
		
		if(chatEmpNo.size()>1) {
			chatRoomType = "C2";
		}

		if(!chatRoomType.equals("C1")) {
			loginEmpNo = loginEmployee.getEmpNo();	
		}

		chatRoomParam.put("chatRoomType", chatRoomType);	//방 타입
		chatRoomParam.put("loginEmpNo", loginEmpNo);	//로그인된 사원번호 (개설자)
		chatRoomParam.put("chatRoomName", chatRoomName);	//채팅방 이름

		int result = service.insertChatRoom(chatRoomParam);

		System.out.println("컨트롤러 - insertChatRoom 결과 : "+result);

		System.out.println("컨트롤러 - chatEmpNo : "+chatEmpNo);
		chatEmpNo.add(loginEmployee.getEmpNo());
		
		//chatRoomNo에 방금생성한 방번호가 담겨져있음
		int chatRoomNo = service.insertChatJoin(chatEmpNo);
		
		System.out.println("컨트롤러 insertChatJoin : "+chatRoomNo);
		
		redirectAttributes.addAttribute("chatRoomNo",chatRoomNo);
		
		return "redirect:/chat/open.do";
	}
	
	
	
	//insert하면서 채팅방에 초대하기
	//방번호 사원번호
	@PostMapping("/insertchatjoin.do")
	@ResponseBody
	public ResponseEntity<String> insertChatJoin(
			@RequestParam("chatRoomNo") int chatRoomNo,
			@RequestParam("chatEmpNo") List<Long> chatEmpNo 
			) {
		System.out.println("컨트롤러 - insertChatJoin - chatRoomNo : "+chatRoomNo);
		System.out.println("컨트롤러 - insertChatJoin - insertchatEmpNo : "+chatEmpNo);
		
		Map<String, Object> param = new HashMap<>();
		param.put("chatRoomNo", chatRoomNo);
		param.put("chatEmpNo", chatEmpNo);
		
		service.insertChatJoinInvite(param);
		
		
		// 초대, 나가기 -> 문구 저장해서 채팅방에서 출력
		//초대 : 로그인된사원 님이 선택된 사원 님, 사원 님, 사원 님을 초대했습니다 -> chatHistory에  chatcontent 테이블에 채팅내용으로 추가
		// 시퀀스번호, 방번호, chatType(10000-초대 20000-나가기), 내용, DEFAULT, 1
		// 사원번호로 사원이름을 가져옴 .forEach돌려서 하나씩 꺼냄 String형태로 문구 만들어서 chatHistory에 저장함
		// 컨트롤러 말고 서비스에서 바로 바로 구현할듯
		Map<String, Object> chParam = new HashMap<>();
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String loginEmpName = loginEmployee.getEmpName();
		chParam.put("chatRoomNo", chatRoomNo);
		chParam.put("chatEmpNo", chatEmpNo);
		chParam.put("loginEmpName", loginEmpName);
		service.insertChatHistoryInvitation(chParam);
		
		return ResponseEntity.ok("Success");
	}
	
	
	// 채팅방 나가기
	//방번호 사원번호
	@PostMapping("/deletechatjoin.do")
	@ResponseBody
	public ResponseEntity<String> deleteChatJoin(
			@RequestParam("chatRoomNo") int chatRoomNo
			) {
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		Long empNo = loginEmployee.getEmpNo();
		
		System.out.println("컨트롤러 - deleteChatJoin - chatRoomNo : "+chatRoomNo);
		System.out.println("컨트롤러 - deleteChatJoin - empNo : "+empNo);
		
		Map<String, Object> param = new HashMap<>();
		param.put("chatRoomNo", chatRoomNo);
		param.put("empNo", empNo);
		
		service.deleteChatJoin(param);
		
		
		// 초대, 나가기 -> 문구 저장해서 채팅방에서 출력
		// 나가기 : 로그인된사원 님이 나갔습니다 -> chatHistory 테이블에 추가
		// 시퀀스번호, 방번호, chatType(10000-초대 20000-나가기), 내용, DEFAULT, 1
		Map<String, Object> chParam = new HashMap<>();
		String loginEmpName = loginEmployee.getEmpName();
		String chatContent = loginEmpName +"님이 나갔습니다";
		
		chParam.put("chatRoomNo", chatRoomNo);
		chParam.put("chatType", 20000);
		chParam.put("chatContent", chatContent);
		
		service.insertChatHistoryLeave(chParam);
		
		return ResponseEntity.ok("Success");
	}
	
	
	//프로필 사원정보 조회
	@PostMapping("/selectEmpProfile.do")
	@ResponseBody
	public Employee selectEmpProfile(
			@RequestParam("empNo") Long empNo
			){
		System.out.println("컨트롤러 - selectEmpProfile - empNo : "+empNo);
		Employee employee = service.selectEmpProfile(empNo);
		return employee;
	}
	
	// 1:1 채팅 방이있으면 방 열기 -> chatRoomOpen (@RequestParam int chatroomNo)
	// 없으면 방생성해서 열기 -> insertChatRoom (@RequestParam(value = "chatRoomName", defaultValue = "") String chatRoomName,
	//										@RequestParam("chatemps") List<Long> chatEmpNo)
	
	//로그인된 사원번호 + 버튼에있는 상대 사원번호 -> 속한 개인채팅방이있으면 1 반환 없으면 null
	
	//숫자를 반환하면 chatRoomOpen 매개변수로 넣어서 보냄 그러면 채팅방 열릴듯?
	//반환 하지 않으면 insertChatRoom 매개변수로 List<Long> chatEmpNo로 자신과 상대방 empNo를 담아서 보내면 채팅방을 만들고 채팅방 열기
	@PostMapping("/profilechatopen.do")
	@ResponseBody
	public Map<String, Object> profilechatopen(
			@RequestParam("chatEmpNo") Long chatEmpNo,
			Model model
			) {
		Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		Long empNo = loginEmployee.getEmpNo();
		
		Map<String, Object> param = new HashMap<>();
		param.put("empNo", empNo); // 현재 로그인한 사원의 사원번호
		param.put("chatEmpNo", chatEmpNo); // 상대방 사원의 사원번호
		
		System.out.println("컨트롤러 - profilechatopen - empNos : "+param);
		Integer chatRoomNo = service.selectProfilechatOpen(param);
		System.out.println("컨트롤러 - profilechatopen - chatRoomNo : "+chatRoomNo);
		
		//반환값 담아서 보내기
		Map<String, Object> resultParam = new HashMap<>();
		
		if(chatRoomNo != null && chatRoomNo != 0) {
			//chatRoomNo가 반환 됐을때	-> chatRoomOpen
			System.out.println("채팅방 번호가 "+chatRoomNo+"임");
			
			resultParam.put("type", "방있음");
			resultParam.put("chatRoomNo", (int)chatRoomNo);
			resultParam.put("empNo",(Long)empNo);
			
			System.out.println("컨트롤러 - profilechatopen - resultParam : "+resultParam);
		}else {
			//chatRoomNo가 null이 반환 됐을때 -> insertChatRoom
			System.out.println("채팅방 번호가 null임");
	
			List<Long> chatemps = new ArrayList<>();
			//상대 사원번호만 담아서 보내기
			chatemps.add(chatEmpNo);
			
			System.out.println("chatEmpNo : "+chatEmpNo);
			
			resultParam.put("type", "방없음");
			resultParam.put("chatemps", chatemps);
			
			System.out.println("컨트롤러 - profilechatopen - resultParam : "+resultParam);
		}
		return resultParam;
	}
	
	
	// 최근 방번호 가져오기 데이터만 전송함
	@PostMapping("/selectgetchatroomno.do")
	@ResponseBody
	public Map<String, Object> selectGetChatRoomNo(){
		Map<String, Object> response = new HashMap<>();
		int chatRoomNo = service.selectGetChatRoomNo();
		response.put("chatRoomNo", chatRoomNo);
		System.out.println("최근 방번호 : "+response);
		return response;
	}
	
	
	
	// 현재는 메세지를 저장할 때 한번에 5개씩 리스트형태로 담아서 저장하기 떄문에 아래 기능을 구현하기에 어려움이 있어 한개씩 바로바로 insert되게 변경해서 구현해야됨.
	
	// 채팅 목록에서 자신이 채팅방 별로 안읽은 숫자 표시
	// 채팅 카운팅? 테이블 만들어서 채팅을 한번 전송하면 채팅기록테이블엔 한번 할때 마다 바로 저장하고, 채팅 카운팅 테이블엔 채팅방에 참여하고 있는 사원 수 만큼 row추가 
	// 채팅목록에서 안읽은 채팅 수 띄울 수 있음 
	
	
	// 채팅방에서 다른사람 혹은 자신이 채팅을 전송했을때 모든사람? 해당하는 사람? 만 채팅목록 새로고침? Ajax해서 최신화 시킴
	// 웹소켓 메세지 전송했을때 리스너 이용해서 Ajax실행시켜서 채팅방 목록 다시 불러오게 만들어서 최신화 
	
	

	
}
