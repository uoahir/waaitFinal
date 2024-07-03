package com.waait.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
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
	public String homeForm() {
		System.out.println("/userPage");
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
		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("session" + employee);
		return "codereviewboard/codeboard";
	}

}
