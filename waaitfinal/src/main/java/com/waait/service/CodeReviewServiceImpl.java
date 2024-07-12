package com.waait.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.CodeReviewDao;
import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardComment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CodeReviewServiceImpl implements CodeReviewService {
	private final CodeReviewDao codeReviewDao;
	private final SqlSession session;

	@Override
	public int insertCodeR(CodeReviewBoard c) {
		int result = codeReviewDao.insertCodeR(session, c);
		int result2 = 0;
		if (c.getCodeFile() != null) {
			result2 = codeReviewDao.insertCodeReviewFile(session, c);
		}
		return result;
	}

	@Override
	public List<CodeReviewBoard> selectcodeReviewBoards(Map<String, Integer> param) {
		List<CodeReviewBoard> codeReviewBoards = codeReviewDao.selectcodeReviewBoards(session, param);
		return codeReviewBoards;
	}
   
	@Override
	public CodeReviewBoard selectcodeReviewBoard(int no) {
		CodeReviewBoard codeReviewBoard = codeReviewDao.selectcodeReviewBoard(session, no);
		return codeReviewBoard;
	}

	@Override
	public int insertCodeReviewR(CodeReviewBoardComment codeReviewC) {
		int result = codeReviewDao.insertCodeReviewR(session,codeReviewC);
		return result;
	}

	@Override
	public List<CodeReviewBoardComment> selectCodeReviewBoardsComment(int no) {
		List<CodeReviewBoardComment> c = codeReviewDao.selectCodeReviewBoardsComment(session,no);
		return c;
	}
	
	/*
	public CodeReview getCodeReviewById(int id) {
	CodeReviewFile crf = codeReviewDao.getCRFByCRId(id); 
	CodeReview cr = codeReviewDao.getCRById(int id); 
	cr.setCodeReviewFile(crf); return cr; 
	}
	*/

}
