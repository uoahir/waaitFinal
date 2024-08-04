package com.waait.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.waait.dto.Allocation;
import com.waait.dto.Employee;
import com.waait.dto.TeamProject;
import com.waait.service.EmployeeService;
import com.waait.service.TeamProjectService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TeamProjectController {
	 
	private final EmployeeService employeeService;
	private final TeamProjectService projectService;
	
	
	@GetMapping("/employee{no}/projects")
	public String projectInfoEmpNo(@PathVariable int no, Model model) {
		System.out.println("no값"+no);
		Employee emp = employeeService.selectByEmpNo(no); //사원 정도 
		List<Allocation> allocations = projectService.selectByEmpNo(no);
		model.addAttribute("emp",emp);
		model.addAttribute("allocations",allocations);
		return "teamproject/empInfo";
	}
	
	
	
	@GetMapping("/teamproject/main")
	public String projectMain(Model model, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage) {
		Map<String, Integer> param = new HashMap<>();
		param.put("cPage", cPage);
		param.put("numPerpage", numPerpage);

		List<TeamProject> teamProjectsSize =  projectService.selectAllTeamProject(); // 크기 구함 model
		List<TeamProject> teamProjects = projectService.projectPage(param);
		int totalData = teamProjectsSize.size();
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "main";

		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");

		sb.append("<script>");
		sb.append("function fn_paging(pageNo) {");
		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
		sb.append("}");
		sb.append("</script>");

		model.addAttribute("pageBar", sb.toString());
			
		
 		model.addAttribute("teamProjects",teamProjects);
 		return "teamproject/main";
		
		
				
	}//첫 메인 화면
	
	// 검색 했을땐 해당 사원 
	

	

	@GetMapping("/teamproject/create")
	public String projectCreate(Model model) {
		List<Employee> employees = employeeService.selectAllEmployees();
		
		model.addAttribute("employees", employees);
		return "teamproject/create";

	}
	@ResponseBody
	@PostMapping("/teamproject/data")
	public ResponseEntity<Map<String,String>> projectInsertData(
			@RequestBody TeamProject teamProject ){
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		teamProject.setEmployee(employee);
		int result =projectService.projectInsertData(teamProject);
		String msg=  "";
		System.out.println(teamProject);
		if(result >0) {
			msg = "Success";
		}
		return ResponseEntity.ok(Map.of("message",msg));
		
	}
	
	@GetMapping("/teamproject{projectNo}/info")
	public String projectInfo(@PathVariable int projectNo,Model model) {
		int rs = 0;
		
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Integer> empList = projectService.checkEmpList(projectNo);  
		System.out.println(empList);
		for(int i = 0; i<empList.size(); i++) {
			if(((long)(empList.get(i))) == employee.getEmpNo()) {
				rs = 1;
			}
		}
		if(rs ==1) {
			Map<String, String> param =  new HashMap<>();
			param.put("projectNo", ""+projectNo);
			param.put("empNo", ""+employee.getEmpNo());
			List<Allocation> allocations = projectService.selectByEmpAlloc(param);
			System.out.println(allocations);
			model.addAttribute("allocations",allocations);
			return "teamproject/kanbanBoard";
		}else {
			return "common/403Error";
		}
	}
	@ResponseBody
	@PostMapping("/canban/todoupdate")
	public ResponseEntity<Map<String,String>> todoUpdate(
			@RequestBody Allocation allocation
			){
		System.out.println(allocation);
		int result = projectService.todoUpdate(allocation);
		Map<String,String> rs = new HashMap<>();
		if(result ==1) {
			rs.put("message", "ok");
		}
		
		return ResponseEntity.ok(rs);
	}
	@ResponseBody
	@PostMapping("/canban/inprogressupdate")
	public ResponseEntity<Map<String,String>> inprogressupdate(
			@RequestBody Allocation allocation){
		int result  = projectService.inprogressupdate(allocation);
		Map<String, String> param = new HashMap<>();
		return ResponseEntity.ok(param);
	}
	@GetMapping("/project{projectNo}/update")
	public String projectUpdate(@PathVariable int projectNo,Model model) {
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		TeamProject teamProject = projectService.selectUpdate(projectNo);
		 System.out.println("프로젝트 매니저 번호"+teamProject.getEmployee().getEmpNo());
		 System.out.println("접속한 번호"+employee.getEmpNo());
		 if(!teamProject.getEmployee().getEmpNo().equals(employee.getEmpNo())) {
			 
			 return "common/403Error";	 
		 }else {
			 model.addAttribute("teamProject",teamProject);
			 model.addAttribute("allocations",teamProject.getAllocationList());
			 System.out.println(teamProject.getAllocationList());
			 return "teamproject/update";
		 }
		 
		
	}
	@ResponseBody
	@PostMapping("/function/approve")
	public ResponseEntity<Map<String,String>> functionStatusUpdate(
			@RequestBody Allocation allocation){
		int result = projectService.functionStatusUpdate(allocation);
		System.out.println("asdasdsadasdad"+result);
		
		Map<String, String> rs = new HashMap<>();
		return ResponseEntity.ok(rs);
	}
	
	@ResponseBody
	@PostMapping("/function/Noapprove")
	public ResponseEntity<Map<String,String>> functionNoStatusUpdate(
			@RequestBody Allocation allocation){
		int result = projectService.functionNoStatusUpdate(allocation);
		System.out.println("asdasdsadasdad"+result);
		
		Map<String, String> rs = new HashMap<>();
		return ResponseEntity.ok(rs);
	}

	
	
}
