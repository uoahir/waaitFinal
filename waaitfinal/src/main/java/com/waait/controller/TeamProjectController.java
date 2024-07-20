package com.waait.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.Employee;
import com.waait.dto.TeamProject;
import com.waait.service.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TeamProjectController {
	ObjectMapper objectMapper;
	private final EmployeeService employeeService;
	
	@GetMapping("/teamproject/main")
	public String projectMain() { 
		return "teamproject/main"; 
	}
	@GetMapping("/teamproject/create")
	public String projectCreate(Model model) {
		List<Employee> employees= employeeService.selectAllEmployees();
		System.out.println(employees);
		model.addAttribute("employees",employees);
		return "teamproject/create";
		
	}
	
	
	@ResponseBody
	@PostMapping("/teamproject/data/check")
	public ResponseEntity<Map<String,String>> ProjectDataTest(
			@RequestBody TeamProject teamProject 
			
			) {
		System.out.println(teamProject);
		System.out.println("통신했음");
		Map<String, String> rs = new HashMap<>();
		rs.put("status","success");
		rs.put("message", "프로젝트가 정상적으로 전송되었습니다");
		
		return ResponseEntity.ok(rs);
	}
	
}
