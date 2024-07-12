package com.waait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/test")
	public String TestCont() {
		return "test";
				
	}
	@GetMapping("/test/layout")
	public String testLayout() {
		return "testlayout";
	}
	@GetMapping("/testpage")
	public String testPage() {
		return "testpage";
	}
	
}
