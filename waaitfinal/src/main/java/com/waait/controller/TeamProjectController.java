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
	List<TeamProject> teamProjects = projectService.selectProjectAll();
		//System.out.println("리스트 값"+teamProjects);
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
	@PostMapping("/teamproject/data/check")
	public ResponseEntity<Map<String, String>> ProjectDataTest(@RequestBody TeamProject teamProject
	) {
		System.out.println(teamProject);
		System.out.println("통신했음");
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		teamProject.setEmployee(employee);
		int result =projectService.insertTeamProject(teamProject);
		System.out.println(result);
		Map<String, String> rs = new HashMap<>();
		rs.put("status", "success");
		rs.put("message", "프로젝트가 정상적으로 전송되었습니다");
		return ResponseEntity.ok(rs);
	}
	@GetMapping("/project{projectNo}/update") // 프로젝트매니저가 보여지는페이지
	public String projectUpdatePage(@PathVariable int projectNo,Model model) {
		TeamProject teamProject = projectService.selectByNoProject(projectNo);
		//System.out.println(teamProject);
		model.addAttribute("teamProject",teamProject);
		return "teamproject/update";
	}
	@GetMapping("/teamproject{projectNo}/info")
	public String projectInfoPage(@PathVariable int projectNo
			,Model model) {
		System.out.println("프로젝트"+projectNo);
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		Long empNo = employee.getEmpNo();
		int result = 0;
		List<Integer> employees = projectService.selectProjectEmployeeList(projectNo);
		for(int i=0; i<employees.size(); i++) {
			System.out.println(employees.get(i));
			if((long)(employees.get(i)) == empNo) {
				result +=1;
			}
		}
		
		//-----------------여기까지가 권한 체크 하는파트---------------------
		if(result == 1) { //해당되는 사원이라면 
			// 데이터 값 저장
			Map<String, Long> projectInfo = new HashMap<>();
			projectInfo.put("empNo", empNo);
			projectInfo.put("projectNo",(long)(projectNo));
			TeamProject teamProject = projectService.allocationByProject(projectInfo);
			
			//System.out.println(teamProject);
			model.addAttribute("teamProject",teamProject);
			
			return "teamproject/kanbanBoard";
		}
		return "redirect:/error/403Page";
	}
	
	@ResponseBody                                                    
	@PostMapping("/canban/todoupdate") //프로젝트를 todo에서 inprogress로 넘겨줌
	public ResponseEntity<Map<String, String>> canbanTodoUpdate(@RequestBody Allocation allocation){
		//System.out.println("값 확인하는거임"+allocation);
		int result = projectService.canbanTodoUpdate(allocation);
		if(result !=0) {
				
		}
		Map<String,String> rs = new HashMap<String, String>();
		return ResponseEntity.ok(rs);
		
	}
	@ResponseBody                                                    
	@PostMapping("/canban/inprogressupdate") //프로젝트를 todo에서 inprogress로 넘겨줌
	public ResponseEntity<Map<String, String>> canbanInprogressUpdate(@RequestBody Allocation allocation){
		System.out.println("값 확인하는거임"+allocation); // 값들어오겠지 
		int result = projectService.canbanInprogressUpdate(allocation);
	
		Map<String,String> rs = new HashMap<String, String>();
		return ResponseEntity.ok(rs);
		
	}
	
	@ResponseBody
	@PostMapping("/function/approve")
	public ResponseEntity<Map<String,String>> functionApprove(@RequestBody Allocation allocation){
		System.out.println("로케이션값"+allocation);
		int result =  projectService.functionApprove(allocation);
		System.out.println(result);
		Map<String, String>rs = new HashMap<>();
		return ResponseEntity.ok(rs);
	}
	

}
