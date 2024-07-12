package com.waait.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.JsTreeDao;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JsTree;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JsTreeServiceImpl implements JsTreeService {
	
	private final SqlSession session;
	private final JsTreeDao jsTreeDao;
	
	@Override
	public List<JsTree> getTreeDeptData() {
		List<JsTree> jstree = new ArrayList<>();
		
		List<Department> dept = jsTreeDao.getTreeDeptData(session);
		for(Department d : dept) {
			jstree.add(JsTree.builder().id(d.getDeptCode()).parent(d.getParentCode()).text(d.getDeptName()).build());
		}
		List<Employee> emp = jsTreeDao.getTreeEmpData(session);
		for(Employee e : emp) {
			jstree.add(JsTree.builder().id(e.getEmpNo()+"").parent(e.getDepartment().getDeptCode()).text(e.getEmpName()).build());
		}
		return jstree;
	}

}
