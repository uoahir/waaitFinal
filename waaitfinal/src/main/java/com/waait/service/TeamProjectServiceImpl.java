package com.waait.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.TeamProjectDao;
import com.waait.dto.Allocation;
import com.waait.dto.Employee;
import com.waait.dto.ProjectFunction;
import com.waait.dto.TeamProject;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamProjectServiceImpl implements TeamProjectService {
	private final SqlSession sqlSession;
	private final TeamProjectDao projectDao; //project부분 dao 
	
	@Override //전체적인 프로젝트를 가져올때 사용한다
	public TeamProject selectByNoProject(int projectNo) {
		
		TeamProject teamProject = projectDao.selectByNoProject(sqlSession,projectNo);
		List<ProjectFunction> projectFunctions = projectDao.selectByNoFunctionList(sqlSession,projectNo);
		List<Employee> employees = projectDao.selectByNoEmployeeList(sqlSession,projectNo);
		List<Allocation> allocationList = projectDao.selectByAllocation(sqlSession,projectNo);
		teamProject.setAllocationList(allocationList);
		teamProject.setProjectEmployee(employees);
		teamProject.setProjectFunctionList(projectFunctions);
		return teamProject;
	}

	@Override
	public int insertTeamProject(TeamProject teamProject) {
		int step1Result = projectDao.insertTeamProject(teamProject, sqlSession);
		int step2Result = 0;
		int step3Result = 0;
		int step4Result = 0;
		//프로젝트가 저장되면 이후 실행
		if (step1Result > 0) {
			int projectNo = teamProject.getProjectNo() + 1; // projectNo를 가져와야했음 이건내 실수
			System.out.println(projectNo);
			for (ProjectFunction function : teamProject.getProjectFunctionList()) {
				function.setProjectNo(projectNo);
				 step2Result = projectDao.insertProjectFunction(function, sqlSession);
			}
			for (Employee employee : teamProject.getProjectEmployee()) {
				Map<String, Object> param = new HashMap<>();
				param.put("employee", employee);
				param.put("projectNo",projectNo);
				 step3Result = projectDao.insertProjectEmployeeList(param,sqlSession);
			}
			//두개의 저장한 값이 완료가 도면 이후 진행
			if(step2Result>0 && step3Result>0) {
				for(Allocation allocation : teamProject.getAllocationList()) {
					allocation.setProjectNo(projectNo);
					step4Result = projectDao.insertProjectAllocation(allocation,sqlSession);
				}
				
			}

		} else {
			return 0;
		}

		return 1;
	}
	
	
	@Override
	public List<TeamProject> selectProjectAll() {
		List<TeamProject> teamProjects = projectDao.selectProjectAll(sqlSession);
		return teamProjects;
	}


	@Override //프로젝트에 정보 사원체크하는 파트 
	public List<Integer> selectProjectEmployeeList(int projectNo) { 
		List<Integer> employees = projectDao.selectProjectEmployeeList(sqlSession, projectNo);
		return employees;
	}
	@Override
	public TeamProject allocationByProject(Map<String, Long> projectInfo) {
		//자신이 할당 받은 기능을 출력
		List<Allocation> allocations = projectDao.allocationByProject(sqlSession,projectInfo); 
		
		//기능 리스트 
		List<ProjectFunction> projectFunctions = projectDao.selectFunctionList(sqlSession,projectInfo);
		//전체 사원을 확인하는 파트
		//List<Employee> employees = projectDao.selectProjectEmployeeList(sqlSession,projectInfo );
		//자식 부터부터 넣어준다.
		TeamProject teamProject =  TeamProject.builder().allocationList(allocations).projectFunctionList(projectFunctions).build();
		return teamProject;
	}


	@Override // todo -> inprogress 
	public int canbanTodoUpdate(Allocation allocation) {
		int result = projectDao.canbanTodoUpdate(sqlSession,allocation); 
		if(result>0) {
		projectDao.canbanTodoUpdatePM(sqlSession, allocation);
		}
		return result;
	}

	@Override //  in progress - > done
	public int canbanInprogressUpdate(Allocation allocation) {			
		int result= projectDao.canbanInprogressUpdatePM(sqlSession, allocation);
		return result;
	}

	@Override //기능 승인 부분
	public int functionApprove(Allocation allocation) {
		int result= projectDao.functionApprove(sqlSession,allocation);
		if(result!=0) {
			projectDao.functionApprovePM(sqlSession,allocation);
		}
		return result;
	}
	
	

}
