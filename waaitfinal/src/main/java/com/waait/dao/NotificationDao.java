package com.waait.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface NotificationDao {
	int saveNotification(Map<String,Object> param, SqlSession session);

}
