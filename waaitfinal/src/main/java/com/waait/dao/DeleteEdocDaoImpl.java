package com.waait.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DeleteEdocDaoImpl implements DeleteEdocDao {

	@Override
	public int deleteEdoc(SqlSession session) {
		// TODO Auto-generated method stub
		return session.delete("edoc.deleteedoc");
	}
	
}
