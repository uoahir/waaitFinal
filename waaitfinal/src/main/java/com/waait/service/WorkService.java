package com.waait.service;

import java.util.Map;

import com.waait.dto.Work;

public interface WorkService {

	int insertWorkStart(Work work);

	Work selectByEmpNoWork(Map<String, String> param);

	int insertLeaveWork(Map<String, Object> map);

}
