package com.waait.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.waait.dao.EmitterDao;
import com.waait.dao.NotificationDao;
import com.waait.dto.Employee;
import com.waait.dto.Notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class NotificationServiceImpl implements NotificationService{
	
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60; //SseEmitter 연결시간
	private final NotificationDao notiDao; // Notification 관련 데이터 저장하는 DAO
	private final EmitterDao emitterDao; // emitter 관련 데이터 저장하는 DAO
	private final SqlSession session;
	
	@Override
	public SseEmitter connection(Employee employee, String lastEventId) {
		// Last-Event-Id를 구분하려는 용도 == data 유실지점 파악
		String id = employee.getEmpNo()+ "_" + System.currentTimeMillis(); 
		// 클라이언트의 SSE 연결 요청에 응답하기 위한 SseEmitter 객체 생성
		// 유효시간 지정으로 시간이 지나면 클라이언트에서 자동으로 재연결 요청함
		SseEmitter emitter = emitterDao.save(id, new SseEmitter(DEFAULT_TIMEOUT)); // 클라이언트와 연결된 SseEmitter 객체를 id와 함께 저장한 후, 생성된 SseEmitter 객체 담아줌
		log.info(emitter.toString());
		log.info(lastEventId);
		
		emitterDao.save(id, emitter);
		
		emitter.onCompletion(()-> emitterDao.delete(id));
		emitter.onTimeout(()-> emitterDao.delete(id));
		emitter.onError((e)-> emitterDao.delete(id));
		
		sendToClient(emitter, id, "연결되었습니다" + employee.getEmpName() + "님");
		
		return emitter;
	}
	
	@Override
	public void send(Long receiver, String message) {
		// 해당 유저가 로그인해서 접속해 있는 상황이어야 실시간으로 알림을 보내줄 수 있다.
		// 알림은, 전자결재/채팅/메일/일정/프로젝트 등에 따라 내용이 달라진다. 따라서, Message 내용만 각자 로직에서 구현해서 send() 메소드를 사용하면 된다.
		Notification noti = createNotification(receiver, message); // 받는 사람과 메시지를 전달하면, Notification 객체를 생성하게 된다.
		Map<String, Object> notification = new HashMap<>();
		notification.put("receiver", receiver);
		notification.put("message", message);
		
		notiDao.saveNotification(notification, session);
		// 우선, dao 로직에 지금 현재 접속해있는 클라이언트 들의 id와 SseEmitter 객체가 저장되어 있다.
		// dao 에 저장되어 있는 클라이언트 들의 id 와 receiver의 empNo 가 일치하는 SseEmitter 객체를 불러와야 한다.
		Map<String, SseEmitter> emitters = emitterDao.findAllStartById(String.valueOf(receiver)); 
		// 알림을 받는 사용자의 empNo로 시작하는 id값이 있으면 전부 불러온다. (현재, SseEmitter 객체가 존재한다는 뜻임 == 서버와 클라이언트가 실시간 통신이 가능하다)
		
		if(!emitters.isEmpty()) {
			// 해당되는 SseEmitter 객체가 존재할 경우 실행되는 로직 
			// 여러 객체가 있을 수 있다(웹, 모바일, 여러 창을 띄워둔 경우 등) 
			emitters.forEach(
					(key,emitter) -> {
						emitterDao.saveEventCache(key, noti);
						sendToClient(emitter, key, noti);
					});
		} else if(emitters.isEmpty()) {
			// 만약 알림을 받는 클라이언트가 접속해있지 않다면 실행되는 로직
			// 해당 emitter가 없으니까, 알림을 저장해야 하는데(id를 receiver + '특정할 수 있는 단어'로 설정해서)
			// 나중에 해당 receiver가 접속했을 때, 보낼 수 있게 할까 ?
			// 아니면 그냥 해당 receiver에게 notification 전체 데이터를 띄워주고, 이후에 오는 실시간 알림만 받을 수 있게 할까 ?
		}
		
	}
	
	@Override
	public void sendToClient(SseEmitter emitter, String id, Object data) {
		try {
			emitter.send(SseEmitter.event()
							.id(id)
							.name("alarm")
							.data(data));
		} catch(IOException e) {
			log.error("SSE 연결 오류 발생", e);
		}
		
		
	}
	
	@Override
	public Notification createNotification(Long receiver, String message) {
		return Notification.builder()
				.receiver(receiver)
				.message(message)
				.readCheck(0)
				.build();
	}
	
	
	
	
	
}
