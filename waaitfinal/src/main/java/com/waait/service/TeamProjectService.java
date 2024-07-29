package com.waait.service;

import java.util.List;
import java.util.Map;

import com.waait.dto.Allocation;
import com.waait.dto.TeamProject;

public interface TeamProjectService {

	int insertTeamProject(TeamProject teamProject);

	List<TeamProject> selectProjectAll();

	List<Integer> selectProjectEmployeeList(int projectNo);

	TeamProject allocationByProject(Map<String, Long> projectInfo);

	int canbanTodoUpdate(Allocation allocation);

	TeamProject selectByNoProject(int projectNo);

	int canbanInprogressUpdate(Allocation allocation);

	int functionApprove(Allocation allocation); 

	
	
}
