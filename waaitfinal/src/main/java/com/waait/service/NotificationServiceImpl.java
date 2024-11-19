package com.waait.service;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
	
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;
	private final NotificationDao notiDao; 
	private final EmitterDao emitterDao; 
	private final SqlSession session;
	
	@Override
	public SseEmitter connection(Employee employee, String lastEventId) { // Last-Event-Id를 구분하려는 용도 == data 유실지점 파악

		if(employee == null) {
			throw new IllegalArgumentException("Employee 정보가 유효하지 않습니다.");
		}
		
		String id = employee.getEmpNo()+ "_" + System.currentTimeMillis(); 
		SseEmitter emitter = emitterDao.save(id, new SseEmitter(DEFAULT_TIMEOUT)); // 클라이언트와 연결된 SseEmitter 객체를 id와 함께 저장한 후, 생성된 SseEmitter 객체 담아줌
		log.info("새로운 SSE 연결 생성 : " + emitter.toString());
		log.info(lastEventId);
		
		Map<String, SseEmitter> emitters = emitterDao.findById(id);
		log.info(emitters.toString());
		
		// SSE 이벤트 핸들러 설정
	    emitter.onCompletion(() -> removeEmitter(emitters, id, "onCompletion"));
	    emitter.onTimeout(() -> removeEmitter(emitters, id, "onTimeout"));
	    emitter.onError(e -> {
	        log.error("SSE 연결 중 에러 발생: {}", e.getMessage(), e);
	        removeEmitter(emitters, id, "onError");
	    });

		
		sendToClient(emitter, id, "연결되었습니다" + employee.getEmpName() + "님");
		
		
		return emitter;
	}
	
	private void removeEmitter(Map<String, SseEmitter> emitters, String id, String reason) {
	    if (emitters != null && emitters.containsKey(id)) {
	        emitterDao.delete(id);
	        emitters.remove(id);
	        log.info("Emitter ID {}가 {} 이벤트로 인해 삭제되었습니다.", id, reason);
	    } else {
	        log.warn("Emitter ID {}를 삭제하려 했지만 이미 존재하지 않거나 null입니다. 이유: {}", id, reason);
	    }
	}
	
	@Override
	public void send(Long receiver, String message) {

		Notification noti = createNotification(receiver, message); 
		Map<String, Object> notification = new ConcurrentHashMap<>();
		notification.put("receiver", receiver);
		notification.put("message", message);
		
		notiDao.saveNotification(notification, session);
		// 우선, dao 로직에 지금 현재 접속해있는 클라이언트 들의 id와 SseEmitter 객체가 저장되어 있다. dao 에 저장되어 있는 클라이언트 들의 id 와 receiver의 empNo 가 일치하는 SseEmitter 객체를 불러와야 한다.
		Map<String, SseEmitter> emitters = emitterDao.findAllStartById(String.valueOf(receiver)); 
		
		if(!emitters.isEmpty()) {
			emitters.forEach(
					(key,emitter) -> {
						emitterDao.saveEventCache(key, noti);
						sendToClient(emitter, key, noti);
					});
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
