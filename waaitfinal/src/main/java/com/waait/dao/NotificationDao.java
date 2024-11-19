package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Notification;

public interface NotificationDao {
	int saveNotification(Map<String,Object> param, SqlSession session);
	List<Notification> findNotificationAllById(Long id, SqlSession session);

}
