package com.waait.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.ChattingDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChattingServiceImpl implements ChattingService {

	private final SqlSession session;
	private final ChattingDao dao;
	
}
