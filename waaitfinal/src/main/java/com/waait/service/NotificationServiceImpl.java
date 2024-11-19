package com.waait.service;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
		if(employee!=null) {
			
		}
		String id = employee.getEmpNo()+ "_" + System.currentTimeMillis(); 
		// 클라이언트의 SSE 연결 요청에 응답하기 위한 SseEmitter 객체 생성
		// 유효시간 지정으로 시간이 지나면 클라이언트에서 자동으로 재연결 요청함
		SseEmitter emitter = emitterDao.save(id, new SseEmitter(DEFAULT_TIMEOUT)); // 클라이언트와 연결된 SseEmitter 객체를 id와 함께 저장한 후, 생성된 SseEmitter 객체 담아줌
		log.info(emitter.toString());
		log.info(lastEventId);
		
//		emitter.onCompletion(()-> emitterDao.delete(id));
//		emitter.onTimeout(()-> emitterDao.delete(id));
//		emitter.onError((e)-> emitterDao.delete(id));
		
//		Map<String, SseEmitter> emitters = emitterDao.findAllStartById(id); // startsById 로 emitters 를 찾아오는 게 아니라, 전체가 일치하는 Id를 없애줘야 함..
		Map<String, SseEmitter> emitters = emitterDao.findById(id);
		emitter.onCompletion(() -> {
		    // emitter가 완료되었을 때, 존재 여부 확인 후 삭제
		    if (emitters.containsKey(id)) {
		        emitterDao.delete(id);
		    }
		});

		emitter.onTimeout(() -> {
		    // 타임아웃 시, 존재 여부 확인 후 삭제
		    if (emitters.containsKey(id)) {
		        emitterDao.delete(id);
		    }
		});

		emitter.onError((e) -> {
		    // 에러 시, 존재 여부 확인 후 삭제
		    if (emitters.containsKey(id)) {
		        emitterDao.delete(id);
		    }
		});
		
		sendToClient(emitter, id, "연결되었습니다" + employee.getEmpName() + "님");
		
		return emitter;
	}
	
	@Override
	public void send(Long receiver, String message) {
		// 해당 유저가 로그인해서 접속해 있는 상황이어야 실시간으로 알림을 보내줄 수 있다.
		// 알림은, 전자결재/채팅/메일/일정/프로젝트 등에 따라 내용이 달라진다. 따라서, Message 내용만 각자 로직에서 구현해서 send() 메소드를 사용하면 된다.
		Notification noti = createNotification(receiver, message); // 받는 사람과 메시지를 전달하면, Notification 객체를 생성하게 된다.
		Map<String, Object> notification = new ConcurrentHashMap<>();
		notification.put("receiver", receiver);
		notification.put("message", message);
		
		notiDao.saveNotification(notification, session);
		// 우선, dao 로직에 지금 현재 접속해있는 클라이언트 들의 id와 SseEmitter 객체가 저장되어 있다.
		// dao 에 저장되어 있는 클라이언트 들의 id 와 receiver의 empNo 가 일치하는 SseEmitter 객체를 불러와야 한다.
		Map<String, SseEmitter> emitters = emitterDao.findAllStartById(String.valueOf(receiver)); 
		// 알림을 받는 사용자의 empNo로 시작하는 id값이 있으면 전부 불러온다. (현재, SseEmitter 객체가 존재한다는 뜻임 == 서버와 클라이언트가 실시간 통신이 가능하다)
		
		if(!emitters.isEmpty()) {
			// 해당되는 SseEmitter 객체가 존재할 경우 실행되는 로직 
			emitters.forEach(
					(key,emitter) -> {
						emitterDao.saveEventCache(key, noti);
						sendToClient(emitter, key, noti);
					});
		} else if(emitters.isEmpty()) {
	
		}
		
	}
	
	@Override
	public void sendToClient(SseEmitter emitter, String id, Object data) {
        try {
            emitter.send(SseEmitter.event()
                            .id(id)
                            .name("alarm")
                            .data(data)); // 객체 그대로 전달
        } catch (IOException e) {
            log.error("SSE 연결 오류 발생", e);
            emitterDao.delete(id);
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
