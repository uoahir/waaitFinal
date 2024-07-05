package com.waait.dao;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Document;

public interface EDocDao {
	int insertDoc(SqlSession session, Document doc);
}
