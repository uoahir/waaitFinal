package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.MovingDepartment;

@Repository
public class EmployeeManagementDao {

	public List<Department> getDepartment(SqlSession session) {
		return session.selectList("em.getDepartment");
	}

	public List<Employee> getEmployees(SqlSession session) {
		return session.selectList("em.getEmployees");
	}
	
	public Employee getEmployeeById(SqlSession session, String empId) {
		return session.selectOne("em.getEmployeeById", empId);
	}

	public Employee searchEmpForModifyDepartment(SqlSession session, Map<String, String> searchParam) {
		return session.selectOne("em.searchEmpForModifyDepartment", searchParam);
	}

	public int modifyEmployeeDept(SqlSession session, Map<String, Object> modifyParam) {
		return session.update("em.modifyEmployeeDept", modifyParam);
	}

	public int insertMovingDepartment(SqlSession session, Map<String, Object> modifyParam) {
		return session.insert("em.insertMovingDepartment", modifyParam);
	}
	
	public List<Department> getTeamListByDeptCode(SqlSession session, String deptCode) {
		return session.selectList("em.getTeamListByDeptCode", deptCode);
	}

	public String getTeamName(SqlSession session, String teamCode) {
		return session.selectOne("em.getTeamName", teamCode);
	}

	public List<MovingDepartment> searchMovingDepartment(SqlSession session, Map<String, Object> sqlParam) {
		return session.selectList("em.searchMovingDepartment", sqlParam);
	}

	public List<Integer> getDeptCode(SqlSession session) {
		return session.selectList("em.getDeptCode");
	}

	public int enrollDepartment(SqlSession session, Map<String, Object> sqlParam) {
		return session.insert("em.enrollDepartment", sqlParam);
	}

	public int enrollDepartmentWithTeam(SqlSession session, Map<String, String> teamSqlParam) {
		return session.insert("em.enrollDepartmentWithTeam", teamSqlParam);
	}


}
