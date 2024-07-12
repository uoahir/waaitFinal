package com.waait.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.waait.dto.Employee;
import com.waait.dto.Schedule;
import com.waait.service.ScheduleService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/schedule")
@Controller
@RequiredArgsConstructor
public class ScheduleController {
	
	private final ScheduleService service;	
	
	@GetMapping("/myschedule")
	public String myschedule(Schedule empNo, Model model) {
		
		Schedule schedule = new Schedule();
		
		Employee employee = getLoginEmpInfo();		
		long empNumber = employee.getEmpNo();				
		/* Schedule emoNo=empNumber */
		
		List<Schedule> total=service.scheduleList(empNumber);
		System.out.println(total);
		schedule.setEmpNo(empNumber);
		
		model.addAttribute("total", total);		
//		System.out.println("스케줄"+schedule.getScheNo());
		total.forEach(e -> {
			System.out.println(e);
		});
		
		return "schedule/schedulemain";
	}
	
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	
//	//teamware 참고
//	@RequestMapping("/myschedule")
//	public void myschedule(Principal principal, Schedule schedule,Model model) {
//		String empId=principal.getName();
//		List<Schedule> scheduleList=service.scheduleList(empNo);
//		model.addAttribute("scheduleList", scheduleList);		
//		
//	}
//			
//	
//	@GetMapping("/myschedule.do")
//	public void mySchedule(
//			@RequestParam(defaultValue="1") int cPage,
//			@RequestParam(defaultValue="5") int numPerpage,
//			Model model) {
//		
//		List<Schedule> result=service.selectList(
//				Map.of("cPage",cPage,"numPerpage",numPerpage));
//		model.addAttribute("schedule", result);
//		int totalData=service.selectScheduleCount();		
//		
//	}
//	
//	// 일정 db에 추가하기 
//	@GetMapping("/insertschedule.do")
//	public void insertSchedule(@ModelAttribute("schedule") @Validated Schedule schedule,
//			BindingResult isResult,Model m) {
//		if(isResult.hasErrors()) {
//			m.add
//		}
//		
//		
//	}
	
//	@GetMapping("/myschedule.do")
//	public void myschedule() {			
//		
//		
//	}
	
	

}
