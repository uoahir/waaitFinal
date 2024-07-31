package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.TodayWork;
import com.waait.dto.Work;

public interface WorkService {

	int insertWorkStart(Work work);

	Work selectByEmpNoWork(Map<String, String> param);

	int insertLeaveWork(Map<String, Object> map);

	List<Work> selectTodayAllWorkList(String today);

	List<Long> selectAllNo(String today);

	int insertDateStatus(List<TodayWork> todayworkList);



}
