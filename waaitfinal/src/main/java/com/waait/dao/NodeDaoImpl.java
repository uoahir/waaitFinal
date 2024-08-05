package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Department;

@Repository
public class NodeDaoImpl implements NodeDao {

	@Override
	public List<Department> getNodeData(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edoc.deptlist");
	}

	@Override
	public List<Map<String, Object>> selectEmpNameLevelName(SqlSession session, String deptCode) {
		return session.selectList("edoc.selectEmpNameLevelName",deptCode);
	}
	
	
	
}
