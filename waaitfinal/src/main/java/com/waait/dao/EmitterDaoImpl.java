package com.waait.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class EmitterDaoImpl implements EmitterDao{
	private final Map<String, SseEmitter> emitters = new HashMap<>();
	private final Map<String, Object> eventCache = new HashMap<>();

	@Override
	public SseEmitter save(String id, SseEmitter sseEmitter) {
		emitters.put(id, sseEmitter);
		return sseEmitter;
	}

	@Override
	public void saveEventCache(String id, Object event) {
		eventCache.put(id, event);
		
	}

	@Override
	public Map<String, SseEmitter> findAllStartById(String id) {
		return emitters.entrySet().stream() // entrySet() 은 Map 의 Key-Value 모음
				.filter(entry -> entry.getKey().startsWith(id)) // emitters Map 중 Key 값이 id로 시작하는 값만 필터해준다.
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)); // 필터한 데이터를 collect를 사용해서 다시 맵으로 만들어준다.
	}

	@Override
	public void deleteAllStartsByWithId(String id) {
		emitters.forEach((key, emitter) -> {
			if(key.startsWith(id)) emitters.remove(key);
		});
	}

	@Override
	public void delete(String id) {
		if(emitters.containsKey(id)) {
			emitters.remove(id);
			log.info("emitter 삭제 완료");
		} else {
			log.error("Emitter 삭제 실패");
		}
	}
	
	
}
