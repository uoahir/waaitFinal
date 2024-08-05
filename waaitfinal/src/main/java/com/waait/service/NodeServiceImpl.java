package com.waait.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.NodeDao;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JsTree;
import com.waait.dto.Node;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NodeServiceImpl implements NodeService {

	private final NodeDao nodeDao;
	private final SqlSession session;
	
//	@Override
//	public List<Department> getNodeData() {
//		// TODO Auto-generated method stub
//		return nodeDao.getNodeData(session);
//	}
	
	@Override
	public List<Node> getNodeData() {
		List<Node> node = new ArrayList<>();
		
		List<Department> dept = nodeDao.getNodeData(session);
		for(Department d : dept) {
			if(d.getParentCode().equals("#")) {
				node.add(Node.builder().id(d.getDeptCode()).title(d.getDeptName()).name(d.getDeptName()).build());
			}
			node.add(Node.builder().id(d.getDeptCode()).pid(d.getParentCode()).title(d.getDeptName()).name(d.getDeptName()).build());
		}
//		List<Employee> emp = jsTreeDao.getTreeEmpData(session);
//		for(Employee e : emp) {
//			jstree.add(JsTree.builder().id(e.getEmpNo()+"").parent(e.getDepartment().getDeptCode()).text(e.getEmpName()).build());
//		}
		return node;
	}
	
	
	
}
