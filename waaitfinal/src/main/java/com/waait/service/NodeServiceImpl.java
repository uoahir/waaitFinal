package com.waait.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.NodeDao;
import com.waait.dto.Department;
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
		System.out.println("node - dept : "+dept);
		for(Department d : dept) {
			// JU 여기 수정했어요
			// # -> null처리 안해야 정상적으로 들어가요
			
			// 직급 JobLevel -> levelName
			// 이름 empName
			String deptCode = d.getDeptCode();
			System.out.println("node - deptCode : "+deptCode);
			//List<Employee> employees = new ArrayList<>();
			//List<String> empNames = nodeDao.selectEmpNameLevelName(session, deptCode);
			List<Map<String, Object>> empNames = nodeDao.selectEmpNameLevelName(session, deptCode);
			System.out.println("node - employees :"+empNames);

			List<String> employees = new ArrayList<>();
			empNames.forEach(e->{
				String levelName = (String) e.get("LEVELNAME");
				String empName = (String) e.get("EMPNAME");
				employees.add(" "+levelName+" "+empName);
			});
//			StringBuilder empBuilder = new StringBuilder();
//	        for (Map<String, Object> e : empNames) {
//	            String levelName = (String) e.get("LEVELNAME");
//	            String empName = (String) e.get("EMPNAME");
//
//	            // 각 사원 정보를 줄 바꿈으로 구분된 문자열로 추가
//	            empBuilder.append(levelName).append(" ").append(empName).append("<br>");
//	        }
	        // 줄 바꿈이 적용된 문자열을 리스트로 변환
	        //List<String> empList = new ArrayList<>();
	        //empList.add(empBuilder.toString().trim());
//			if(d.getParentCode().equals("#")) {
//				node.add(Node.builder().id(d.getDeptCode()).title(d.getDeptName()).name(d.getDeptName()).build());
//			}
			node.add(Node.builder()
					.id(d.getDeptCode())
					.pid(d.getParentCode())
					.name(d.getDeptName())
					.employees(employees)
					.build());
			
			System.out.println("for문 node : "+node);
			//employees.clear();
		}
//		List<Employee> emp = jsTreeDao.getTreeEmpData(session);
//		for(Employee e : emp) {
//			jstree.add(JsTree.builder().id(e.getEmpNo()+"").parent(e.getDepartment().getDeptCode()).text(e.getEmpName()).build());
//		}
		return node;
	}
	
	
	
}
