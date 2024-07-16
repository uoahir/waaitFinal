package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardComment;
import com.waait.dto.CodeReviewBoardFile;

public interface CodeReviewDao{
		int insertCodeR(SqlSession session,CodeReviewBoard b);
		int insertCodeReviewFile(SqlSession session, CodeReviewBoard c);
		List<CodeReviewBoard> selectcodeReviewBoards(SqlSession session, Map<String, Integer> param);
		CodeReviewBoard selectcodeReviewBoard(SqlSession session, int no);
		int insertCodeReviewR(SqlSession session, CodeReviewBoardComment codeReviewC); //코드작성부분
		List<CodeReviewBoardComment> selectCodeReviewBoardsComment(SqlSession session,int no);
		int selectAllCodeReviewBoard(SqlSession session);
}
