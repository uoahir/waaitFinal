package com.waait.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.waait.dto.Employee;
import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
import com.waait.dto.SpamDomain;
import com.waait.mypage.model.service.MailService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {
	
	private final MailService service;
	
	@GetMapping("/mailmain.do")
	public void changeMailView(Model model,
								@RequestParam(defaultValue = "1") int cPage) {
//		SecurityContextImpl security = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
//		System.out.println("권한 : " + security.getAuthentication().getAuthorities());
//		Employee employee = (Employee) security.getAuthentication().getPrincipal();
//		System.out.println("employee security : " + employee);
		
		Employee employee = getLoginEmpInfo();
		String receiverMailAddress = employee.getEmpAddress();
		long empNo = employee.getEmpNo();
		int numPerpage = 0;
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		
		List<MailSetting> mailSetting = service.getMailSetting(empNo);
		if(mailSetting == null) {
			service.setMailSetting(empNo);
			numPerpage = 5;
		} else {
			numPerpage = mailSetting.get(0).getMailNumPerpage();			
		}
		Map<String, Object> mailSettings = Map.of("cPage", cPage, "numPerpage", numPerpage,
													"spamDomains", spamDomains, "receiverMailAddress", receiverMailAddress);
		
//		String receiverMailAddress = "waait@waait.com";
		List<Mail> mailList = service.getReceiveMail(mailSettings);
		System.out.println("가져온 mailList : " + mailList);
		model.addAttribute("mails", mailList);
	}
	
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
