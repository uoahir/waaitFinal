package com.waait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/codereviewboard")
public class CodeReviewController {

	
	@PostMapping("/insert")
	public String insertCodeR(String codeBoardTitle,String codeType) {
		System.out.println("코드제목"+codeBoardTitle);
		System.out.println("코드 종류"+codeType);
		return "redirect:/user";
	}
	
}
