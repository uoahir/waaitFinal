package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Allocation;
import com.waait.dto.Employee;
import com.waait.dto.ProjectFunction;
import com.waait.dto.TeamProject;
public interface TeamProjectDao {
	int insertTeamProject(TeamProject teamProject,SqlSession session);
	int insertProjectFunction(ProjectFunction projectFunction, SqlSession sqlSession);
	int insertProjectEmployeeList(Map<String, Object> param, SqlSession sqlSession);
	int insertProjectAllocation(Allocation allocation, SqlSession sqlSession);
	List<TeamProject> selectProjectAll(SqlSession sqlSession);
	List<Integer> selectProjectEmployeeList(SqlSession sqlSession, int projectNo);
	List<Allocation> allocationByProject(SqlSession sqlSession, Map<String, Long> projectInfo);
	List<ProjectFunction> selectFunctionList(SqlSession sqlSession, Map<String, Long> projectInfo);
	List<Employee> selectProjectEmployeeList(SqlSession sqlSession, Map<String, Long> projectInfo);
	int canbanTodoUpdate(SqlSession sqlSession, Allocation allocation);
	void canbanTodoUpdatePM(SqlSession sqlSession, Allocation allocation);
	TeamProject selectByNoProject(SqlSession sqlSession, int projectNo);
	List<ProjectFunction> selectByNoFunctionList(SqlSession sqlSession, int projectNo);
	List<Employee> selectByNoEmployeeList(SqlSession sqlSession, int projectNo);
	List<Allocation> selectByAllocation(SqlSession sqlSession, int projectNo);

	int canbanInprogressUpdatePM(SqlSession sqlSession, Allocation allocation);
	int functionApprove(SqlSession sqlSession, Allocation allocation);
	void functionApprovePM(SqlSession sqlSession, Allocation allocation);
	
		
	
}
