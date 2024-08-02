package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Allocation;
import com.waait.dto.TeamProject;

public interface TeamProjectService {

	int projectInsertData(TeamProject teamProject);

	List<TeamProject> selectAllTeamProject();

	List<Integer> checkEmpList(int projectNo);

	List<Allocation> selectByEmpAlloc(Map<String, String> param);

	int todoUpdate(Allocation allocation);

	int inprogressupdate(Allocation allocation);

	TeamProject selectUpdate(int projectNo);

	int functionStatusUpdate(Allocation allocation);

	int functionNoStatusUpdate(Allocation allocation);

	int projectUpdateStatus(String today);



	
	
}
