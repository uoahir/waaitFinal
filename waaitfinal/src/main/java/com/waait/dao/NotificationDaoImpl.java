package com.waait.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NotificationDaoImpl implements NotificationDao{

	@Override
	public int saveNotification(Map<String, Object> param, SqlSession session) {
		return session.insert("notice.saveNotification", param);
	}
}
