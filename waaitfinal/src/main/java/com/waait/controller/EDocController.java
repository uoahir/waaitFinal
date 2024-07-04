package com.waait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/edoc")
public class EDocController {
	
	@GetMapping("/insertedoc")
	public void insertDoc() {}
	
	@PostMapping("/insertedocend")
	public String insertDocEnd() {
		
		return "redirect:/edoc/insertedoc";
	}
	
	@GetMapping("/appline")
	public void appline() {}
	
	
}
