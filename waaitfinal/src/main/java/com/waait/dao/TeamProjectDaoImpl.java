package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Allocation;
import com.waait.dto.Employee;
import com.waait.dto.ProjectFunction;
import com.waait.dto.TeamProject;

@Repository
public class TeamProjectDaoImpl implements TeamProjectDao {

	@Override
	public List<Integer> selectProjectEmployeeList(SqlSession sqlSession, int projectNo) {

		return sqlSession.selectList("teamProject.selectProjectEmployeeList", projectNo);
	}

	@Override // 화면에 프로젝트 리스트 출력용 list
	public List<TeamProject> selectProjectAll(SqlSession sqlSession) {

		return sqlSession.selectList("teamProject.selectProjectAll");
	}

	@Override // 사원 할당 부분
	public int insertProjectAllocation(Allocation allocation, SqlSession sqlSession) {
		return sqlSession.insert("teamProject.insertProjectAllocation", allocation);
	}

	@Override
	public int insertProjectFunction(ProjectFunction projectFunction, SqlSession sqlSession) {

		return sqlSession.insert("teamProject.insertProjectFunction", projectFunction);
	}

	@Override // team에 관한 데이터
	public int insertTeamProject(TeamProject teamProject, SqlSession session) {
		return session.insert("teamProject.insertTeamProject", teamProject);
	}

	@Override // team
	public int insertProjectEmployeeList(Map<String, Object> param, SqlSession sqlSession) {

		return sqlSession.insert("teamProject.insertProjectEmployeeList", param);
	}

	// ---------------------------------------------------------------------
	@Override // 로그인한 사원이 기능을 할당을 출력하는 부분
	public List<Allocation> allocationByProject(SqlSession sqlSession, Map<String, Long> projectInfo) {

		return sqlSession.selectList("teamProject.allocationByProject", projectInfo);
	}

	@Override // 프로젝트에대한 전체적인 기능을 리스트를 출력하는 부분
	public List<ProjectFunction> selectFunctionList(SqlSession sqlSession, Map<String, Long> projectInfo) {

		return sqlSession.selectList("teamProject.selectFunctionList", projectInfo);
	}
	 
	@Override //프로젝트 사원을 리스트 public List<Employee>
	public List<Employee> selectProjectEmployeeList(SqlSession sqlSession, Map<String, Long> projectInfo) {
		
		return sqlSession.selectList("teamProject.selectProjectEmployeeList",projectInfo); 
	}

	// ---------------------------------------------------------------------
	@Override
	public int canbanTodoUpdate(SqlSession sqlSession, Allocation allocation) {
		
		return sqlSession.update("teamProject.canbanTodoUpdate",allocation);
	}

	@Override //프로젝트 매니저과 확인
	public void canbanTodoUpdatePM(SqlSession sqlSession, Allocation allocation) {
		sqlSession.update("teamProject.canbanTodoUpdatePM",allocation);
		
	}
	//-----------------------------------선택한 프로젝트 하나 가저오거-------------------------------
	@Override
	public TeamProject selectByNoProject(SqlSession sqlSession, int projectNo) {
		
		return sqlSession.selectOne("teamProject.selectByNoProject",projectNo);
	}

	@Override
	public List<ProjectFunction> selectByNoFunctionList(SqlSession sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("teamProject.selectByNoFunctionList",projectNo);
	}

	@Override
	public List<Employee> selectByNoEmployeeList(SqlSession sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("teamProject.selectByNoEmployeeList",projectNo);
	}
	
	@Override
	public List<Allocation> selectByAllocation(SqlSession sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("teamProject.selectByAllocation",projectNo);
	}
	//------------------------------------선택한 프로젝트 내용---------------------------
	//----------------------프로젝트 in-progress -> done check -----------------------
	

	@Override
	public int canbanInprogressUpdatePM(SqlSession sqlSession, Allocation allocation) {
		return sqlSession.update("teamProject.canbanInprogressUpdatePM",allocation);
		
	}
	//-------------------------------------------------------------------------------

	@Override
	public int functionApprove(SqlSession sqlSession, Allocation allocation) {
		return sqlSession.update("teamProject.functionApprove",allocation);
	}

	@Override
	public void functionApprovePM(SqlSession sqlSession, Allocation allocation) {
		sqlSession.update("teamProject.functionApprovePM",allocation);
		
	}
	
	
	
}