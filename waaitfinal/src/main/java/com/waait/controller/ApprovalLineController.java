package com.waait.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.waait.dto.Employee;
import com.waait.service.EDocService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ApprovalLineController {

	private final EDocService edocService;
	
	@GetMapping("/employees")
	public List<Employee> getAllEmployees(){
		System.out.println(edocService.employeeList());
		return edocService.employeeList();
	}
}
