package com.waait.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {
	SseEmitter createEmitter(Long empId);
}
