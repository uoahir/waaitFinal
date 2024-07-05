package com.waait.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.service.EDocService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/edoc")
@RequiredArgsConstructor
public class EDocController {
	
	private final EDocService service;
	
	@GetMapping("/insertedoc")
	public void insertDoc() {}
	
	@PostMapping("/insertedocend")
	public String insertDocEnd() {
		
		return "redirect:/edoc/insertedoc";
	}
	
	@GetMapping("/appline")
	public void appline(Model m) {
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
	}
	
	@GetMapping("/home")
	public void home() {}
	
	
}
