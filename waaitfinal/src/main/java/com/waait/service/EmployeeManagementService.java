package com.waait.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.EmployeeManagementDao;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JobLevel;
import com.waait.dto.MovingDepartment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeManagementService {
	
	private final EmployeeManagementDao dao;
	private final SqlSession session;
			
	public List<Department> getDepartment() {
		return dao.getDepartment(session);
	}

	public List<Employee> getEmployees(Map<String, Integer> pagingParam, Map<String, String> sqlParam) {
		return dao.getEmployees(session, pagingParam, sqlParam);
	}
	
	public int getEmpListBySearchTotalData(Map<String, Object> param) {
		return dao.getEmpListBySearchTotalData(session, param);
	}
	
	public int getEmployeesTotalData() {
		return dao.getEmployeesTotalData(session);
	}
	
	public List<Employee> searchEmployee(Map<String, Object> sqlParam, Map<String, Integer> pagingParam) {
		return dao.searchEmployee(session, sqlParam, pagingParam);
	}
	
	public List<JobLevel> getJobLevel() {
		return dao.getJobLevel(session);
	}
	
	public Employee getEmployeeById(String empId) {
		return dao.getEmployeeById(session, empId);
	}

	public Employee searchEmpForModifyDepartment(Map<String, String> searchParam) {
		return dao.searchEmpForModifyDepartment(session, searchParam);
	}
	
	public List<Department> getTeamListByDeptCode(String deptCode) {
		return dao.getTeamListByDeptCode(session, deptCode);
	}
	
	@Transactional
	public int modifyEmployeeDept(Map<String, Object> modifyParam) {
		int result = 0;
		result = dao.modifyEmployeeDept(session, modifyParam);
		
		String teamCode = (String) modifyParam.get("wantModifyTeamCode");
		String wantModifyTeamName = dao.getTeamName(session, teamCode);
		
		modifyParam.put("wantModifyTeamName", wantModifyTeamName);
		result = dao.insertMovingDepartment(session, modifyParam);
		return result;
	}

	public List<MovingDepartment> searchMovingDepartment(Map<String, Object> sqlParam) {
		return dao.searchMovingDepartment(session, sqlParam);
	}

	public List<Integer> getDeptCode() {
		return dao.getDeptCode(session);
	}

	@Transactional
	public int enrollDepartment(Map<String, Object> sqlParam) {
		int result = 0;
		Map<String, String> teamSqlParam = new HashMap<String, String>();
		if(sqlParam.get("newTeamNameStr") == null) {
			result = dao.enrollDepartment(session, sqlParam);
		} else {
			result = dao.enrollDepartment(session, sqlParam);
			
			int newDepartmentSeq = (int) sqlParam.get("newDeptCodeNumber");
			
			String newTeamNameStr = (String) sqlParam.get("newTeamNameStr");
			if(newTeamNameStr.contains(",")) {
				String[] teamNameArr = newTeamNameStr.split(",");
				for(int i = 0; i < teamNameArr.length; i++) {
					teamSqlParam.put("newDeptCode", (String) sqlParam.get("newDeptCode"));
					teamSqlParam.put("teamCode", "D" + (newDepartmentSeq + i + 1));
					teamSqlParam.put("teamName", teamNameArr[i] + "팀");
					result = dao.enrollDepartmentWithTeam(session, teamSqlParam);
				}
			} else {
				teamSqlParam.put("newDeptCode", (String) sqlParam.get("newDeptCode"));
				teamSqlParam.put("teamCode", "D" + (newDepartmentSeq + 1));
				teamSqlParam.put("teamName", newTeamNameStr);
				result = dao.enrollDepartmentWithTeam(session, teamSqlParam);
			}
		}
		return result;
	}

	public int enrollTeam(Map<String, Object> jsonParam) {
		int result = 0;
		jsonParam.put("teamName", jsonParam.get("teamName") + "팀");
		if(jsonParam.containsKey("parentDeptCode")) {
			result = dao.enrollTeamWithParentDept(session, jsonParam);
		} else {
			result = dao.enrollTeamNoParentDept(session, jsonParam);
		}
		return result;
	}

	public int enrollEmployee(Employee employee) {
		return dao.enrollEmployee(session, employee);
	}

}
