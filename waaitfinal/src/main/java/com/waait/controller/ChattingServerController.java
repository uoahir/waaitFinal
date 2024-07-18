package com.waait.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.ChatRoom;
import com.waait.dto.Message;
import com.waait.service.ChattingService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ChattingServerController extends TextWebSocketHandler{
	
	//session을 따로 관리해줘야함	//WebSocketSession 안에 메소드 머시기
		private Map<String,WebSocketSession> clients = new HashMap<>();
		
		//bean선언때 기본생성자로 선언해서 이렇게 불러와서 사용해야 함.
		//jackson 라이브러리의 클래스 JSON데이터를 java객체로 변환, java객체를 JSON데이터로 변환 하는데 사용함. 
		
		private final ObjectMapper mapper;
		
		//service
		private final ChattingService service;
		
		
		//들어왔을때 메소드 실행
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("손님들어왔다!");
			
			
			
			
		}

		
		//웹소켓 객체가 send 했을때, 전송 했을때	//TextMessage 값 타입을 JSON으로 받음 
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			//json으로 넘어와 관리하기 쉽게 DTO 객체를 만들어서 파싱해서 사용함. JSON -> java객체
			Message msg = null; 
					//mapper.readValue(message.getPayload(), Message.class);
			//페이로드 개발자도구로 볼때 있는 데이터를 자바DTO객체로 만든다.
			
			System.out.println("전송메세지 : "+msg);
			//Message 타입의 msg안에 있는 필드값 type을 이용해서 switch문 어느 메소드를 작동할지 정할 수 있다.
			switch(msg.getType()) {
				case "open" : addClient(session,msg);break;
				case "msg" : sendMessage(msg);break;
				case "close" : break;
				
				case "채팅목록" : chatRoomlist(msg);break;
				
			}
			
		}

		
		//웹소켓 close했을때, 닫았을 때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//			log.info("손님 나갔다~");
			String id = "";
			for(Map.Entry<String, WebSocketSession> client : clients.entrySet()) {
				WebSocketSession cSession = client.getValue();	//클라이언트의 value? id값?
				if(session.equals(cSession)) {	//session에 저장된 아이디와 웹소켓이 관리하는 세션아이디가 같으면 작동
					id = client.getKey();	//id에 해당 id 저장
					break;
				}
			}
			clients.remove(id);	//관리하는 세션에서 해당하는 id 삭제
			sendMessage(Message.builder().type("close").empName(id).build());	//메세지를 전송 type을 close, 해당하는 id
			attendMessage();	//접속자 최신화
			
		}

		
		private void addClient(WebSocketSession session, Message msg) {
			// 같은 session이 들어오면 덮어쓰기가 되어 하나만 접속되서 관리됨..? // msg.getSender를 이용해서 접속한 아이디면 접속 안시키고 등 여러방법으로 관리 가능
			clients.put(msg.getEmpName(), session);	
			sendMessage(msg);
			attendMessage();
			
		}
		
		
		//참석한 멤버
		private void attendMessage() {
			try {
				Message msg = Message.builder()
						.type("attend")
						.chatContent(mapper.writeValueAsString(clients.keySet()))	//java객체 -> JSON
						.build();
				sendMessage(msg);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		//sender를 이용해 String으로 비교해서 같은 값이면 같은 객체라 판단해서 분기처리 해야함.
		private void sendMessage(Message msg) {
			System.out.println("sendMessage msg : "+msg);
			for(Map.Entry<String,WebSocketSession> client : clients.entrySet()) {

				WebSocketSession cSession = client.getValue();
				try {
					//객체를 String 형태로 만들고  
					String message = mapper.writeValueAsString(msg);	
					System.out.println("sendMessage 메소드 : "+message);
					//String으로 만든걸 웹소켓이 받을 수 있는 형태로 만들어서 웹소켓세션이 가지고 있는 메소드를 이용해서 해당하는(모든 세션)한테 전달함?
					cSession.sendMessage(new TextMessage(message));	//이걸로 다시 보내는 듯?? 세션을 살려봐야할꺼같은데 -> js server.onmessage로 가는듯?
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		private void chatRoomlist(Message msg) {
			System.out.println("chatRoomlist 실행");
//			Employee loginEmployee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
//			long loginEmpNo = loginEmployee.getEmpNo();
			
			long loginEmpNo = msg.getEmpNo();
			List<ChatRoom> chatRoomlist = service.selectChatRoomlist(loginEmpNo);
			System.out.println("chatRoomlist : "+chatRoomlist);
			
			Map<String, Object> chatRoomtotal = new HashMap<>();
			chatRoomtotal.put("type", msg.getType());
			chatRoomtotal.put("chatRoomlist", chatRoomlist);
			System.out.println("chatRoomlist - chatRoomtotal : "+chatRoomtotal);
			
			for(Map.Entry<String,WebSocketSession> client : clients.entrySet()) {
//				System.out.println("이거머야 : "+client.getValue());
				WebSocketSession cSession = client.getValue();
				
				try {
					//객체를 String 형태로 만들고 
					String chatRooms = mapper.writeValueAsString(chatRoomtotal);
					
					 System.out.println("sendMessage 메소드 : "+chatRooms); //String으로 만든걸 웹소켓이 받을 수 있는
					 //형태로 만들어서 웹소켓세션이 가지고 있는 메소드를 이용해서 해당하는(모든 세션)한테 전달함? 
					 cSession.sendMessage(new TextMessage(chatRooms)); //이걸로 다시 보내는 듯?? 세션을 살려봐야할꺼같은데 -> js server.onmessage로 가는듯?
					 
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
			}
		}
		
		
		
		
	}
