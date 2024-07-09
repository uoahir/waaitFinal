package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.CodeReviewBoard;

public interface CodeReviewService {
	int insertCodeR(CodeReviewBoard c);

	List<CodeReviewBoard> selectcodeReviewBoards(Map<String, Integer> param);

	CodeReviewBoard selectcodeReviewBoard(int no);
	

}
