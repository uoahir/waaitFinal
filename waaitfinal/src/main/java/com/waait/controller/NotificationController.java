package com.waait.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.waait.dto.Employee;
import com.waait.dto.Notification;
import com.waait.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@CrossOrigin(origins = "http://localhost:5731", allowCredentials = "true")
@RequestMapping("/api/user")
public class NotificationController {
	
	private final NotificationService notificationService;
	
	@GetMapping(value = "/notification", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public SseEmitter Notifications(@AuthenticationPrincipal Employee employee,
									@RequestHeader(value = "Last-Event-ID", required = false, defaultValue="") String lastEventId) {
		log.info(lastEventId);		
		return notificationService.createEmitter(employee.getEmpNo());
	}
	
}
