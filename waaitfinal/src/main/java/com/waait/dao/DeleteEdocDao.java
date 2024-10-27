package com.waait.dao;

import org.apache.ibatis.session.SqlSession;

public interface DeleteEdocDao {
	int deleteEdoc(SqlSession session);
}
