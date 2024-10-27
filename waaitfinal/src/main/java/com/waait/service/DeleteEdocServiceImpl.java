package com.waait.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.DeleteEdocDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeleteEdocServiceImpl implements DeleteEdocService {
	final DeleteEdocDao deleteEdocDao;
	final SqlSession session;

	@Override
	public int deleteEdoc() {
		// TODO Auto-generated method stub
		return deleteEdocDao.deleteEdoc(session);
	}
	
	
	
}
