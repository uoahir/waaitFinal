package com.waait.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	@GetMapping("/error/403Page") // 권한 부여 
	public String error403Page() {
		return "common/403Error";
	}
	
	
}
