package com.waait.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NotificationServiceImpl implements NotificationService{
	
	
	
	@Override
	public SseEmitter createEmitter(Long empNo) {

		
		return new SseEmitter(empNo);
	}
	
	
	
	
	
}
