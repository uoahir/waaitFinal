package com.waait.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.dto.Mail;
import com.waait.dto.SpamDomain;
import com.waait.mypage.model.service.MailService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {
	
	private final MailService service;
	
	@GetMapping("/mailmain.do")
	public void changeMailView(Model model) {
		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String receiverMailAddress = employee.getEmpAddress();
		Long empNo = employee.getEmpNo();
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		
//		SecurityContextImpl security = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
//		System.out.println("권한 : " + security.getAuthentication().getAuthorities());
//		Employee employee = (Employee) security.getAuthentication().getPrincipal();
//		System.out.println("employee security : " + employee);
		
		
//		String receiverMailAddress = "waait@waait.com";
		List<Mail> mailList = service.getReceiveMail(receiverMailAddress);
		System.out.println(mailList);
		model.addAttribute("mails", mailList);
	}
}
