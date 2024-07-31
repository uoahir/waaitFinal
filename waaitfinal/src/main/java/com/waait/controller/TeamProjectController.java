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
	@GetMapping("/teamproject/main")
	public String projectMain(Model model) {
		List<TeamProject> teamProjects =  projectService.selectAllTeamProject();
		model.addAttribute("teamProjects",teamProjects);
		return "teamproject/main";
	}//첫 메인 화면

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
		return ResponseEntity.ok(null);
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

}
