package com.waait.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.CodeReviewDao;
import com.waait.dto.CodeReviewBoard;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CodeReviewServiceImpl implements CodeReviewService{
	private final CodeReviewDao codeReviewDao;
	private final SqlSession session;
	@Override
	public int insertCodeR(CodeReviewBoard c) {
		int result=codeReviewDao.insertCodeR(session, c);
		int result2=0;
		if(c.getCodeFile() != null) {
			result2 = codeReviewDao.insertCodeReviewFile(session, c.getCodeFile());
		}
		return result;
	}	
	
}
