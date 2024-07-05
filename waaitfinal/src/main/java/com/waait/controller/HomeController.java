package com.waait.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.waait.dto.Employee;
import com.waait.service.EmployeeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	private final EmployeeService employeeService;
	private final BCryptPasswordEncoder encoder;

	@GetMapping("/login")
	public String loginForm() {
		System.out.println("/loginPage");

		return "login";
	}

	@GetMapping("/user")
	public String homeForm(HttpSession session) {
		
		return "home";

	}

	@GetMapping("/")
	public String homeForm1() {
		System.out.println("/userPage");
		return "redirect:/user";

	}

	@PostMapping("/insertemp")
	public String testInsertEmp(Employee e) {
		System.out.println("이름:" + e.getEmpName());
		System.out.println("아이디:" + e.getEmpId());
		System.out.println("비밀번호:" + e.getEmpPwd());
		Employee employee = e.builder().empId(e.getEmpId()).empName(e.getEmpName())
				.empPwd(encoder.encode(e.getEmpPwd())).build();
		employeeService.insertEmployee(employee);
		return "redirect:/user";
	}

	@GetMapping("/codeboard")
	public String codePage(HttpSession session) {
		System.out.println("이거는 내가 가져온 세션값이야!!"+session.getAttribute("employee"));
		System.out.println("확인 : " + session.getAttribute("SPRING_SECURITY_CONTEXT"));
		System.out.println("이거는 객체변환확인"+session.getAttribute("SPRING_SECURITY_CONTEXT"));
		return "codereviewboard/codeboard";
	}

}
