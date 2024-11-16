package com.waait.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.waait.dao.NotificationDao;
import com.waait.dto.Notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class NotificationServiceImpl implements NotificationService{
	
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60; //SseEmitter 연결시간
	private final Map<String, Object> userEmitter = new HashMap<>();
	private final NotificationDao notificationDao;
	
	@Override
	public SseEmitter createEmitter(Long empNo) {
		
		String id = empNo+ "_" + System.currentTimeMillis();
		SseEmitter emitter = new SseEmitter(Long.MAX_VALUE); // 클라이언트랑 서버랑 연결될 때 생기는 객체임 !
		log.info(emitter.toString());
		
		userEmitter.put("id", id);
		userEmitter.put("emitter", emitter);
		
		notificationDao.saveEmitter(userEmitter);
		try {
			emitter.send(SseEmitter.event().name("connect").data("Success"));
			log.info("Sent connect event");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		emitter.onCompletion(()-> notificationDao.delete(id));
		emitter.onTimeout(()-> notificationDao.delete(id));
		emitter.onError((e)-> notificationDao.delete(id));
		
		return emitter;
	}
	
	private void send(Long receiver, String message) {
		Notification noti = createNotification(receiver, message);
		
		
		
	}
	
	private Notification createNotification(Long receiver, String message) {
		return Notification.builder()
				.receiver(receiver)
				.message(message)
				.read(false)
				.build();
	}
	
	
	
	
	
}
