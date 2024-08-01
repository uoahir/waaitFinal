package com.waait.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.TeamProjectDao;
import com.waait.dto.Allocation;
import com.waait.dto.TeamProject;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamProjectServiceImpl implements TeamProjectService {
	

	private final SqlSession sqlSession;
	private final TeamProjectDao projectDao; //project부분 dao 
	
	
	@Override
	public int functionNoStatusUpdate(Allocation allocation) {
		int rs = projectDao.functionNoStatusUpdate(sqlSession,allocation);
		return rs;
	}
	
	
	@Override
	public int projectInsertData(TeamProject teamProject) {
		
		int projectResult = projectDao.projectInsertData(sqlSession, teamProject);
		if(projectResult>0) {
			for(Allocation allocation :teamProject.getAllocationList()) {
				allocation.setProjectNo(teamProject.getProjectNo());
				int result=projectDao.allocationData(sqlSession,allocation);
			}	
		}
		
		
		return projectResult;
	}
	@Override
	public List<TeamProject> selectAllTeamProject() {
		List<TeamProject> teamprojectList = projectDao.selectAllTeamProject(sqlSession);
		return teamprojectList;
	}
	
	@Override
	public List<Integer> checkEmpList(int projectNo) {
		List<Integer> empList = projectDao.checkEmpList(sqlSession,projectNo);
		return empList;
	}
	@Override
	public List<Allocation> selectByEmpAlloc(Map<String, String> param) {
		List<Allocation> allocations = projectDao.selectByEmpAlloc(sqlSession,param);
		return allocations;
	}
	@Override
	public int todoUpdate(Allocation allocation) {
		int result = projectDao.todoUpdate(sqlSession,allocation);
		return result;
	}
	@Override
	public int inprogressupdate(Allocation allocation) {
		int result = projectDao.inprogressupdate(sqlSession,allocation);
		return result;
	}
	
	@Override
	public TeamProject selectUpdate(int projectNo) {
		List<Allocation> allocation = projectDao.selectByProjectNoAllocation(sqlSession, projectNo);
		TeamProject teamProject = projectDao.selectByProjectNoTeamproject(sqlSession,projectNo);
		teamProject.setAllocationList(allocation);
		return teamProject;
	}
	@Override
	public int functionStatusUpdate(Allocation allocation) {
		int rs = projectDao.functionStatusUpdate(sqlSession,allocation);
		return rs;
	}
}
