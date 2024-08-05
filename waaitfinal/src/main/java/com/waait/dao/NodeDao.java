package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waait.dto.Department;


public interface NodeDao {
	List<Department> getNodeData(SqlSession session);
	
	List<Map<String, Object>> selectEmpNameLevelName(SqlSession session, String deptCode);
}
