package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Notification;

@Repository
public class NotificationDaoImpl implements NotificationDao{

	@Override
	public int saveNotification(Map<String, Object> param, SqlSession session) {
		return session.insert("notice.saveNotification", param);
	}

	@Override
	public List<Notification> findNotificationAllById(Long id, SqlSession session) {
		return session.selectList("notice.findNotificationAllById", id);
	}
	
	
}
