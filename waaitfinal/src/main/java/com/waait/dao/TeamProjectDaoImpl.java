package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Allocation;
import com.waait.dto.TeamProject;

@Repository
public class TeamProjectDaoImpl implements TeamProjectDao {

	@Override 		//스케줄러로 업데이트함
	public int projectUpdateStatus(SqlSession sqlSession, String today) {
		
		return sqlSession.update("teamProject.projectUpdateStatus",today);
	}

	@Override
	public int inprogressupdate(SqlSession sqlSession, Allocation allocation) {
		return sqlSession.update("teamProject.inprogressupdate",allocation);
	}

	@Override
	public List<TeamProject> projectPage(SqlSession sqlSession, Map<String, Integer> param) {
		RowBounds rw = new RowBounds(
				(param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage"));
		return sqlSession.selectList("teamProject.projectPage",null,rw);
	}

	@Override
	public List<Allocation> selectByEmpAlloc(SqlSession sqlSession, Map<String, String> param) {
		
		return sqlSession.selectList("teamProject.selectByEmpAlloc",param);
	}

	@Override
	public int todoUpdate(SqlSession sqlSession, Allocation allocation) {
		
		return sqlSession.update("teamProject.todoUpdate",allocation);
	}

	@Override
	public List<Integer> checkEmpList(SqlSession sqlSession, int projectNo) {
		
		return sqlSession.selectList("teamProject.checkEmpList",projectNo);
	}

	@Override
	public int projectInsertData(SqlSession sqlSession, TeamProject teamProject) {
		
		return sqlSession.insert("teamProject.insertTeamProject",teamProject);
	}

	@Override
	public int allocationData(SqlSession sqlSession, Allocation allocation) {
		
		return sqlSession.insert("teamProject.allocationData",allocation);
	}

	@Override
	public List<TeamProject> selectAllTeamProject(SqlSession sqlSession) {
		
		return sqlSession.selectList("teamProject.selectAllTeamProject");
	}

	@Override
	public List<Allocation> selectByProjectNoAllocation(SqlSession sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("teamProject.selectByProjectNoAllocation",projectNo);
	}

	@Override
	public TeamProject selectByProjectNoTeamproject(SqlSession sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("teamProject.selectByProjectNoTeamproject",projectNo);
	}

	@Override
	public int functionStatusUpdate(SqlSession sqlSession, Allocation allocation) { //승인
		
		return sqlSession.update("teamProject.functionStatusUpdate",allocation);
	}

	@Override
	public int functionNoStatusUpdate(SqlSession sqlSession, Allocation allocation) {
		// TODO Auto-generated method stub
		return sqlSession.update("teamProject.functionNoStatusUpdate" ,allocation);
	}

	@Override
	public List<Allocation> selectByEmpNo(SqlSession sqlSession, int no) {
		
		return sqlSession.selectList("teamProject.selectByEmpNo",no);
	}



		
	
	
}