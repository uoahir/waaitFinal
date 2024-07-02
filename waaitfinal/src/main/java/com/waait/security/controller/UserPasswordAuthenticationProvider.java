package com.waait.security.controller;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.waait.dto.Employee;
import com.waait.service.EmployeeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class UserPasswordAuthenticationProvider implements AuthenticationProvider {

	private final EmployeeService employeeService;
	private final BCryptPasswordEncoder encoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String empId = authentication.getName(); // 아이디
		String empPwd = (String) authentication.getCredentials(); // 패스워드
		Employee employee = employeeService.selectEmployee(empId); //서비스 로직
		System.out.println(empId);
		System.out.println(empPwd);
		System.out.println(employee);
		if (employee != null && encoder.matches(empPwd, employee.getEmpPwd())) {
			return new UsernamePasswordAuthenticationToken(employee, employee.getEmpPwd(), employee.getAuthorities());
		} else {
			throw new BadCredentialsException("권한 접근이 없는 사용자입니다");
		}
		
		

	} // 인증

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	} // 인증 수단

}
