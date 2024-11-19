package com.waait.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.waait.dto.Employee;
import com.waait.dto.Notification;

public interface NotificationService {
	SseEmitter connection(Employee employee, String lastEventId);
	void send(Long receiver, String message);
	void sendToClient(SseEmitter emitter, String id, Object data);
	Notification createNotification(Long receiver, String message);
}
