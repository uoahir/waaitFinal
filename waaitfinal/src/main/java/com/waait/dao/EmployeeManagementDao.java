package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JobLevel;
import com.waait.dto.MovingDepartment;

@Repository
public class EmployeeManagementDao {
	
	public RowBounds getRowBounds(Map<String, Integer> pagingParam) {
		int cPage = pagingParam.get("cPage");
		int numPerpage = pagingParam.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);
		return rb;
	}

	public List<Department> getDepartment(SqlSession session) {
		return session.selectList("em.getDepartment");
	}

	public List<Employee> getEmployees(SqlSession session, Map<String, Integer> pagingParam, Map<String, String> sqlParam) {
		RowBounds rb = getRowBounds(pagingParam);
		return session.selectList("em.getEmployees", sqlParam, rb);
	}
	
	public int getEmployeesTotalData(SqlSession session) {
		return session.selectOne("em.getEmployeesTotalData");
	}
	
	public int getEmpListBySearchTotalData(SqlSession session, Map<String, Object> param) {
		return session.selectOne("em.getEmpListBySearchTotalData", param);
	}
	
	public List<Employee> searchEmployee(SqlSession session, Map<String, Object> sqlParam,
			Map<String, Integer> pagingParam) {
		RowBounds rb = getRowBounds(pagingParam);
		return session.selectList("em.searchEmployee", sqlParam, rb);
	}
	
	public int empDetailSearchTotalData(SqlSession session, Map<String, Object> sqlParam) {
		return session.selectOne("em.empDetailSearchTotalData", sqlParam);
	}
	
	public List<JobLevel> getJobLevel(SqlSession session) {
		return session.selectList("em.getJobLevel");
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
	
	public int modifyDeptName(SqlSession session, Map<String, String> sqlParam) {
		return session.update("em.modifyDeptName", sqlParam);
	}
	
	public int getEmpCountByDeptCode(SqlSession session, String deptCode) {
		return session.selectOne("em.getEmpCountByDeptCode", deptCode);
	}
	
	public int deleteDept(SqlSession session, String deptCode) {
		return session.delete("em.deleteDept", deptCode);
	}

	public int enrollTeamWithParentDept(SqlSession session, Map<String, Object> sqlParam) {
		return session.insert("em.enrollTeamWithParentDept", sqlParam);
	}

	public int enrollTeamNoParentDept(SqlSession session, Map<String, Object> sqlParam) {
		return session.insert("em.enrollTeamNoParentDept", sqlParam);
	}
	
	public int checkDuplication(SqlSession session, String modifyName) {
		return session.selectOne("em.checkDuplication", modifyName);
	}
	
	public int modifyTeamName(SqlSession session, Map<String, String> sqlParam) {
		return session.update("em.modifyTeamName", sqlParam);
	}
		
	public int enrollEmployee(SqlSession session, Employee employee) {
		return session.insert("em.enrollEmployee",employee);
	}

}
