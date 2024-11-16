package com.waait.dao;

import java.util.Map;

public interface NotificationDao {
	int saveEmitter(Map<String,Object> param); // empNo + time, emitter
	int saveNotice(Map<String,Object> param);
	int delete(String id);

}
