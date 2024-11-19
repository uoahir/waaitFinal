package com.waait.dao;

import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface EmitterDao {
	SseEmitter save(String id, SseEmitter sseEmitter);
	void saveEventCache(String id, Object event);
	Map<String, SseEmitter> findAllStartById(String id);
	void deleteAllStartsByWithId(String id);
	void delete(String id);
}
