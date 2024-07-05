package com.waait.dao;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardFile;

public interface CodeReviewDao{
		int insertCodeR(SqlSession session,CodeReviewBoard b);
		int insertCodeReviewFile(SqlSession session, CodeReviewBoardFile codeFile);
}
