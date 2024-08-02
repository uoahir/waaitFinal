package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Allocation;
import com.waait.dto.Employee;
import com.waait.dto.ProjectFunction;
import com.waait.dto.TeamProject;
public interface TeamProjectDao {

	int projectInsertData(SqlSession sqlSession, TeamProject teamProject);

	int allocationData(SqlSession sqlSession, Allocation allocation);

	List<TeamProject> selectAllTeamProject(SqlSession sqlSession);

	List<Integer> checkEmpList(SqlSession sqlSession, int projectNo);

	List<Allocation> selectByEmpAlloc(SqlSession sqlSession, Map<String, String> param);

	int todoUpdate(SqlSession sqlSession, Allocation allocation);

	int inprogressupdate(SqlSession sqlSession, Allocation allocation);

	List<Allocation> selectByProjectNoAllocation(SqlSession sqlSession, int projectNo);

	TeamProject selectByProjectNoTeamproject(SqlSession sqlSession, int projectNo);

	int functionStatusUpdate(SqlSession sqlSession, Allocation allocation);

	int functionNoStatusUpdate(SqlSession sqlSession, Allocation allocation);

	
		
		
	
}
