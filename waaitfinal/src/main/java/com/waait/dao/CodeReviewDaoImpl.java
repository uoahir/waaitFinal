package com.waait.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardFile;

@Repository
public class CodeReviewDaoImpl implements CodeReviewDao{

	@Override
	public int insertCodeR(SqlSession session, CodeReviewBoard b) {
		return session.insert("codeReview.insertCodeR",b);
	}

	@Override
	public int insertCodeReviewFile(SqlSession session, CodeReviewBoardFile codeFile) {
		return session.insert("codeReview.insertCodeReviewFile",codeFile);
	}

}
