package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardComment;
import com.waait.dto.CodeReviewBoardFile;

@Repository
public class CodeReviewDaoImpl implements CodeReviewDao{

	@Override
	public int insertCodeR(SqlSession session, CodeReviewBoard b) {
		return session.insert("codeReview.insertCodeR",b);
	}

	@Override
	public int insertCodeReviewFile(SqlSession session, CodeReviewBoard codeFile) {
		return session.insert("codeReview.insertCodeReviewFile",codeFile);
	}

	@Override
	public List<CodeReviewBoard> selectcodeReviewBoards(SqlSession session, Map<String, Integer> param) {
		RowBounds rw = new RowBounds(
		(param.get("cPage")-1)*param.get("numPerpage"),
		param.get("numPerpage"));
		return session.selectList("codeReview.selectcodeReviewBoards", null, rw);
	}

	@Override
	public CodeReviewBoard selectcodeReviewBoard(SqlSession session, int no) {
		return session.selectOne("codeReview.selectcodeReviewBoard", no);
	}

	@Override
	public int insertCodeReviewR(SqlSession session, CodeReviewBoardComment codeReviewC) {
		return session.insert("codeReview.insertCodeReviewR",codeReviewC);
	}

	@Override
	public List<CodeReviewBoardComment> selectCodeReviewBoardsComment(SqlSession session,int no) {
		return session.selectList("codeReview.selectCodeReviewBoardsComment",no);
	}

}
