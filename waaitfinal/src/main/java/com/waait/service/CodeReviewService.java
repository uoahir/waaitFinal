package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardComment;

public interface CodeReviewService {
	int insertCodeR(CodeReviewBoard c);

	List<CodeReviewBoard> selectcodeReviewBoards(Map<String, Integer> param);

	CodeReviewBoard selectcodeReviewBoard(int no);

	int insertCodeReviewR(CodeReviewBoardComment codeReviewC); //댓글작성한부분

	List<CodeReviewBoardComment> selectCodeReviewBoardsComment(int no);
	

}
